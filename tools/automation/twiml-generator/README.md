# Generate TwiML Code Samples

## Setup
Install the dependencies:
```bash
pip install -r requirements.txt
```

Make sure you installed the dependencies for code-sample-formatter
```bash
cd ../code-sample-formatter
npm install
```

## How to run

```bash
usage: generator.py [-h] [-l {csharp,java,node,php,python}]
                    root_twiml_filepath

positional arguments:
  root_twiml_filepath   Path to a directory containing TwiML file

optional arguments:
  -h, --help            show this help message and exit
  -l {csharp,java,node,php,python}, --languages {csharp,java,node,php,python}
                        Languages for the code to generate (default: all)
```

`root_twiml_filepath` will be scanned recursively for any `.xml` files and generate the code samples in the parent directory (we expect them to be placed in an `output` directory).
`--languages` can be used if you want to generate code for specific languages.

For example, to generate all Java snippets under __/twiml/message__:
```bash
./generator.py ../../../twiml/message -l java
```
