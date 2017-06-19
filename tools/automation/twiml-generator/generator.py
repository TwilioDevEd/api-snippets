#!/usr/bin/env python
# coding: utf-8
from twiml_generator import TwimlCodeGenerator, load_language_spec
from pathlib import Path
from lxml import etree

import argparse
import shutil
import subprocess

LANGUAGES_VERSIONS = {
    'python': '6.x',
    'java': '7.x',
    'csharp': '5.x',
    'node': '3.x',
    'php': '5.x',
    'ruby': '5.x'
}


def generate_code_sample_filepath(twiml_filepath, language):
    if language not in LANGUAGES_VERSIONS:
        raise Exception('Unkown language to generate : {}'.format(language))

    language_spec = load_language_spec(language)
    version = LANGUAGES_VERSIONS[language]
    return twiml_filepath.parent.parent / (twiml_filepath.name[:-5] + version + language_spec['extension'])

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("root_twiml_filepath", help="Path to a directory containing TwiML file")
    parser.add_argument("-l", "--languages", help="Languages for the code to generate (default: all)",
                        choices=['csharp', 'java', 'node', 'php', 'python', 'ruby'],
                        action="append")
    parser.add_argument("-t", "--test", help="Test the snippet against the input",
                        action="store_true")
    args = parser.parse_args()

    if not args.languages:
        languages = LANGUAGES_VERSIONS.keys()
    else:
        languages = args.languages

    filepaths = Path(args.root_twiml_filepath).glob('**/*.twiml')
    for twiml_filepath in filepaths:
        try:
            for language in languages:
                code_filepath = generate_code_sample_filepath(twiml_filepath, language)
                print("{} -> {}".format(twiml_filepath, code_filepath), end='')
                code_generator = TwimlCodeGenerator(
                    twiml_filepath,
                    code_filepath=code_filepath,
                    lib_filepath=Path(__file__).parent / 'lib',
                    language=language)
                if language in ['java', 'csharp', 'php']:
                    formater_path = Path(__file__).parent / '../code-sample-formatter/app.js'
                    code_generator.overwrite_language_spec('formatter', 'node ' + str(formater_path) + ' -f {filepath}')
                code_generator.write_code()

                if args.test:
                    result, stdout, input_tree, output_tree = code_generator.verify()
                    if result == TwimlCodeGenerator.VERIFY_SUCCESS:
                        print(' \x1B[92m[passed]\x1B[39m')
                    elif result == TwimlCodeGenerator.VERIFY_FAILURE:
                        print(' \x1B[91m[failed]\x1B[39m')
                        print('INPUT:\n' + input_tree)
                        print('OUTPUT:\n' + output_tree)
                    else:
                        print(' \x1B[91m[error]\x1B[39m')
                        print(stdout)
                else:
                    print('')
        except etree.XMLSyntaxError as e:
            print('\nError parsing : {}'.format(twiml_filepath))
