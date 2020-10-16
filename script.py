#!/usr/bin/env python3
import os
import re

IGNORED_FOLDERS = ['tools', 'venv', 'guides', 'twiml', 'node_modules', '.git']


def file_iter(dir='.', file_ext=None):
    for (root, dirs, files) in os.walk(dir):
        if root in IGNORED_FOLDERS:
            continue
        for file in files:
            if os.path.splitext(file)[1] == file_ext:
                yield os.path.join(root, file)


def cs_fix():
    # print(list(file_iter(file_ext='.cs')))
    counter = 0
    for file in file_iter(file_ext='.cs'):
        content = ''
        with open(file) as f:
            content = f.read()
        if 'Environment.GetEnvironmentVariable' in content and 'using System;' not in content:
            if 'using System.' not in content:
                # no files found here
                lines = []
                with open(file) as f:
                    lines = f.readlines()
                for line in lines:
                    if not line.startswith('//'):
                        lines.insert(lines.index(line), 'using System;\n')
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
                    if 'using System.' in line:
                        lines.insert(lines.index(line), 'using System;\n')
                        break
                with open(file, 'w') as f:
                    f.write("".join(lines))
                    counter = counter + 1
                # print("".join(lines))
                # print(content)
    print(f'{counter} C# files edited.')


def replace_placeholders(file_ext, placeholders):
    counter = 0
    for file in file_iter(file_ext=file_ext):
        content = ''
        with open(file) as f:
            content = f.read()
        for key, value in placeholders.items():
            p = re.compile(key)
            new_content = p.sub(value, content)
            content = new_content
        with open(file, 'w') as f:
            f.write("".join(content))
            counter = counter + 1
        # if 'token =' in content:
        #     print(content)
        #     break
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


if __name__ == "__main__":
    # cs_fix()
    # replace_placeholders('.php', {
    #     r'[\'\"]AC[Xx].+[\'\"]': 'getenv(\'TWILIO_ACCOUNT_SID\')',
    #     r'[\'\"]your_auth_token[\'\"]': 'getenv(\'TWILIO_AUTH_TOKEN\')',
    #     r'[\'\"]SK[Xx].+[\'\"]': 'getenv(\'TWILIO_API_KEY\')',
    #     r'[\'\"]your_auth_apiKeySecret[\'\"]': 'getenv(\'TWILIO_API_KEY_SECRET\')',
    #     r'[\'\"]your_api_key_secret[\'\"]': 'getenv(\'TWILIO_API_KEY_SECRET\')',
    #     r'[\'\"]your_api_secret[\'\"]': 'getenv(\'TWILIO_API_KEY_SECRET\')',
    #     r'[\'\"]YOUR_API_SECRET[\'\"]': 'getenv(\'TWILIO_API_KEY_SECRET\')',
    #     r'[\'\"]xxx.*[\'\"]': 'getenv(\'TWILIO_API_KEY_SECRET\')'
    # })
    # add_comment('.php', '//', 'getenv')
    replace_placeholders('.rb', {
        r'[\'\"]AC[Xx].+[\'\"]': 'ENV[\'TWILIO_ACCOUNT_SID\']',
        r'[\'\"]your_auth_token[\'\"]': 'ENV[\'TWILIO_AUTH_TOKEN\']',
        r'[\'\"]SK[Xx].+[\'\"]': 'ENV[\'TWILIO_API_KEY\']',
        r'[\'\"]your_auth_apiKeySecret[\'\"]': 'ENV[\'TWILIO_API_KEY_SECRET\']',
        r'[\'\"]your_api_key_secret[\'\"]': 'ENV[\'TWILIO_API_KEY_SECRET\']',
        r'[\'\"]your_api_secret[\'\"]': 'ENV[\'TWILIO_API_KEY_SECRET\']',
        r'[\'\"]YOUR_API_SECRET[\'\"]': 'ENV[\'TWILIO_API_KEY_SECRET\']',
        r'[\'\"]xxx.*[\'\"]': 'ENV[\'TWILIO_API_KEY_SECRET\']'
    })
    add_comment('.rb', '#', 'ENV')
