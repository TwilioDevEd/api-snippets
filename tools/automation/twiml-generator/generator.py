#!/usr/bin/env python
# coding: utf-8
from twiml_generator import TwimlCodeGenerator, load_language_spec
from pathlib import Path
from lxml.etree import XMLSyntaxError

import argparse

LANGUAGES_VERSIONS = {
    'python': '6.x',
    'java': '7.x',
    'csharp': '5.x',
    'node': '3.x',
    'php': '5.x'
}


def generate_code_sample_filepath(twiml_filepath, language):
    if language not in LANGUAGES_VERSIONS:
        raise Exception('Unkown language to generate : {}'.format(language))

    language_spec = load_language_spec(language)
    version = LANGUAGES_VERSIONS[language]
    return twiml_filepath.parent.parent / (twiml_filepath.name[:-3] + version + language_spec['extension'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("root_twiml_filepath", help="Path to a directory containing TwiML file")
    parser.add_argument("-l", "--languages", help="Languages for the code to generate (default: all)",
                        choices=['csharp', 'java', 'node', 'php', 'python'],
                        action="append")
    args = parser.parse_args()

    if not args.languages:
        languages = LANGUAGES_VERSIONS.keys()
    else:
        languages = args.languages

    filepaths = Path(args.root_twiml_filepath).glob('**/*.xml')
    for twiml_filepath in filepaths:
        try:
            for language in languages:
                code_filepath = generate_code_sample_filepath(twiml_filepath, language)
                print("{} -> {}".format(twiml_filepath, code_filepath))
                code_generator = TwimlCodeGenerator(twiml_filepath, language=language)
                if language in ['java', 'csharp', 'php']:
                    code_generator.overwrite_language_spec('formatter', 'node ../code-sample-formatter/app.js -f {filepath}')
                code_generator.write_code()
        except XMLSyntaxError as e:
            print('Error parsing : {}'.format(twiml_filepath))
