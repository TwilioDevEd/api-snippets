#!/usr/bin/env python
"""Tool to find a CMS Page using a given snippet."""

import argparse
import json
import os
import psycopg2
import sys

from collections import namedtuple


class PostgresConnection(object):
    """Simple wrapper around a psycopg2 connection."""

    def __init__(self, dbname='twilio_docs', host='localhost', port='5432', username=None, password=None):
        """Create Open and Store a connection to PostgresSql."""
        try:
            kwargs = {
                'dbname': dbname,
                'host': host,
                'port': port,
                'username': username,
                'password': password
            }
            self.conn = psycopg2.connect(**kwargs)
        except:
            print("Unable to connect to the database")
            sys.exit(1)

    def __enter__(self):
        """Return a new cursor."""
        return self.conn.cursor()

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Do nothing the cursor will be closed on del."""
        pass


def get_arg_parser():
    """Get the CLI argument parser for this tool."""
    parser = argparse.ArgumentParser(description='Find which page is using a snippet or tutorial.')
    parser.add_argument('snippet', help='Snippet filename or filepath from api-snippet')
    parser.add_argument('--dbname', help='Postgres database name', default='twilio_docs')
    parser.add_argument('--host', help='Postgres host name', default='localhost')
    parser.add_argument('--port', help='Postgres port number', default='5432')
    parser.add_argument('--username', help='Postgres username', default=None)
    parser.add_argument('--password', help='Postgres password', default=None)
    return parser


def get_code_sample(sample_name, cur):
    """Return an iterator to all the CodeSample found for a given name."""
    fields = ['id', 'title', 'path', 'sample_type', 'description', 'code_repository_id']
    CodeSample = namedtuple('CodeSample', fields)
    if os.path.splitext(sample_name)[1] is not None:
        # This is probably a file, we'll need the parent directory to look up
        sample_name = os.path.dirname(sample_name)
    sample_name = os.path.abspath(sample_name).split('api-snippets/')[1]
    cur.execute(
        """SELECT {fields} FROM code_samples_codesample WHERE path like '%{sample_name}'; """.format(
            fields=', '.join(fields), sample_name=sample_name))
    return map(CodeSample._make, cur.fetchall())


def _get_pages_for_code_sample(code_sample_id, cur, table):
    """Return a list of pages using the given CodeSample ID for a specific model."""
    fields = ['id', 'title', 'url_path']
    Page = namedtuple('Page', fields)
    cur.execute(
        """SELECT {fields} FROM {table} JOIN wagtailcore_page ON page_ptr_id = id
        WHERE body like '%"type": "code_sample", "value": {code_sample_id}%'
        OR    body like '%"code_sample": {code_sample_id}%';""".format(
            fields=', '.join(fields), table=table, code_sample_id=code_sample_id))
    return list(map(Page._make, cur.fetchall()))


def get_mission_objective_for_code_sample(code_sample_id, cur):
    """Return an iterator of Twilio Quest MissionObjective using the given CodeSample."""
    fields = ['id', 'title']
    MissionObjective = namedtuple('MissionObjective', fields)
    cur.execute(
        """SELECT {fields} FROM twilio_quest_missionobjective
        WHERE body like '%"type": "code_sample", "value": {code_sample_id}%'
        OR    body like '%"code_sample": {code_sample_id}%';""".format(
            fields=', '.join(fields), code_sample_id=code_sample_id))
    return map(MissionObjective._make, cur.fetchall())


def get_pages_for_code_sample(code_sample_id, cur):
    """Return a dict with the various Page models using CodeSample as keys, and the list of pages as values."""
    pages = {}
    pages['ApiReferencePage'] = _get_pages_for_code_sample(code_sample_id, cur, 'api_reference_apireferencepage')
    pages['ContentSnippetPage'] = _get_pages_for_code_sample(code_sample_id, cur, 'content_snippets_contentsnippetpage')
    pages['ErrorCodePage'] = _get_pages_for_code_sample(code_sample_id, cur, 'error_codes_errorcodepage')
    pages['GlossaryPage'] = _get_pages_for_code_sample(code_sample_id, cur, 'glossary_glossarypage')
    return {k: v for k, v in pages.items() if len(v) > 0}


if __name__ == '__main__':
    # Get argparser and parse CLI options
    parser = get_arg_parser()
    args = parser.parse_args()

    # Open a PostgresSQL connection
    conn = PostgresConnection(
        dbname=args.dbname,
        host=args.host,
        port=args.port,
        username=args.username,
        password=args.username
    )

    with conn as cur:
        # Get all the code samples possible for the given path
        for code_sample in get_code_sample(args.snippet, cur):
            print('Code Sample:')
            print('#{code_sample.id} - {code_sample.title}'.format(code_sample=code_sample))
            print('-> https://www.twilio.com/docs/admin/snippets/code_samples/codesample/{id}/'.format(id=code_sample.id))

            # Look up pages where this code sample is used
            for kind, pages in get_pages_for_code_sample(code_sample.id, cur).items():
                print('\n' + kind + ':')
                for page in pages:
                    print('#{page.id} - {page.title}'.format(page=page))
                    print('-> https://www.twilio.com/docs/admin/pages/{page.id}/edit/'.format(page=page))
                    print('-> https://www.twilio.com{page.url_path}'.format(page=page))

            # Twilio Quest MissionObjective can also embed CodeSample (unlikely from api-snippets)
            for mission_objective in get_mission_objective_for_code_sample(code_sample.id, cur):
                print('#{mission_objective.id} - Twilio Quest Mission Objective - {mission_objective.title}'.format(mission_objective=mission_objective))
