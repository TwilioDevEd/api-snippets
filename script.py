#!/usr/bin/env python3

import os
import re

IGNORED_FOLDERS = ['tools', 'venv', 'guides', 'twiml', 'node_modules', '.git']


def file_iter(dir='.', file_ext=None):
    for (root, dirs, files) in os.walk(dir, topdown=True):
        dirs[:] = [d for d in dirs if d not in IGNORED_FOLDERS]
        if root not in IGNORED_FOLDERS:
            for file in files:
                if os.path.splitext(file)[1] == file_ext:
                    yield os.path.join(root, file)


def add_import(file_ext, _import, condition, comment, import_before):
    # print(list(file_iter(file_ext='.cs')))
    counter = 0
    for file in file_iter(file_ext=file_ext):
        content = ''
        with open(file) as f:
            content = f.read()
        if condition in content and _import not in content:
            if not import_before:
                lines = []
                with open(file) as f:
                    lines = f.readlines()
                for line in lines:
                    if not line.startswith(comment):
                        lines.insert(lines.index(line), f'{_import}\n')
                        break
                # print("".join(lines))
                with open(file, 'w') as f:
                    f.write("".join(lines))
                    counter = counter + 1
            else:
                lines = []
                with open(file) as f:
                    lines = f.readlines()
                for line in lines:
                    if import_before in line:
                        lines.insert(lines.index(line), f'{_import}\n')
                        break
                with open(file, 'w') as f:
                    f.write("".join(lines))
                    counter = counter + 1
                # print("".join(lines))
                # print(content)
    print(f'{counter} {file_ext} files added imports.')


def replace_placeholders(file_ext, placeholders):
    counter = 0
    for file in file_iter(file_ext=file_ext):
        content = ''
        with open(file) as f:
            content = f.read()
        for regex, value in placeholders:
            p = re.compile(regex)
            new_content = p.sub(value, content)
            content = new_content
        with open(file, 'w') as f:
            f.write("".join(content))
            counter = counter + 1
    print(f'{counter} {file_ext} files replaced placeholders.')


def add_comment(file_ext, comment_char, condition):
    counter = 0
    comment = 'To set up environmental variables, see http://twil.io/secure'
    for file in file_iter(file_ext=file_ext):
        content = ''
        with open(file) as f:
            content = f.read()
        if condition in content and comment not in content:
            lines = []
            with open(file) as f:
                lines = f.readlines()
            for line in lines:
                if condition in line:
                    lines.insert(lines.index(line), f'{comment_char} {comment}\n')
                    break
            with open(file, 'w') as f:
                f.write("".join(lines))
                counter = counter + 1
    print(f'{counter} {file_ext} files added comments.')


class PlaceholderReplacer():
    def __init__(self, account_sid, auth_token, api_key, api_secret):
        self.placeholders = [
            (r'[\'\"]AC[Xx].+[\'\"]', account_sid),
            (r'[\'\"]your_auth_token[\'\"]', auth_token),
            (r'[\'\"]SK[Xx].+[\'\"]', api_key),
            (r'[\'\"]your_auth_apiKeySecret[\'\"]', api_secret),
            (r'[\'\"]your_api_key_secret[\'\"]', api_secret),
            (r'[\'\"]your_api_secret[\'\"]', api_secret),
            (r'[\'\"]YOUR_API_SECRET[\'\"]', api_secret),
            (r'[\'\"]xxx.*[\'\"]', api_secret)
        ]

    def __iter__(self):
        yield from self.placeholders


if __name__ == "__main__":
    add_import('.cs', 'using System', 'Environment.GetEnvironmentVariable', '//', 'using System.')
    replace_placeholders('.php', PlaceholderReplacer(
        'getenv(\'TWILIO_ACCOUNT_SID\')',
        'getenv(\'TWILIO_AUTH_TOKEN\')',
        'getenv(\'TWILIO_API_KEY\')'
        'getenv(\'TWILIO_API_KEY_SECRET\')'
    )
    add_comment('.php', '//', 'getenv')
    replace_placeholders('.rb', PlaceholderReplacer(
        'ENV[\'TWILIO_AUTH_TOKEN\']',
        'ENV[\'TWILIO_ACCOUNT_SID\']',
        'ENV[\'TWILIO_API_KEY\']'
        'ENV[\'TWILIO_API_KEY_SECRET\']'
    )
    add_comment('.rb', '#', 'ENV')
    replace_placeholders('.rb', PlaceholderReplacer(
        'os.environ[\'TWILIO_AUTH_TOKEN\']',
        'os.environ[\'TWILIO_ACCOUNT_SID\']',
        'os.environ[\'TWILIO_API_KEY\']'
        'os.environ[\'TWILIO_API_KEY_SECRET\']'
    )
    add_comment('.py', '#', 'os.environ')
    add_import('.py', 'import os', 'os.environ', '#', None)
