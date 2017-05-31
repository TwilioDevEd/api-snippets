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

## Setup for running the snippets

Any snippet execution is relative to your current `$PWD`.
We recommand to stay in `api-snippets/tools/automation/twiml-generator` and setup 

### Python

You need twilio-python which should be installed in your virtualenv.

```bash
cd api-snippets
virtualenv venv
source venv/bin/activate
pip install twilio
```

### Node

You need twilio-node in your `node_modules`.

```bash
cd api-snippets
npm install twilio
```

### PHP

You need `composer` either on your system or in your current directory.
If you want it locally you can download (composer.phar)(https://getcomposer.org/download/)

```bash
php composer.phar require twilio/sdk
```

### Java

You need the JDK installed on your machine and the (twilio jar with dependencies)(http://search.maven.org/remotecontent?filepath=com/twilio/sdk/twilio/7.11.0/twilio-7.11.0-jar-with-dependencies.jar) in a `lib` directory beside `generator.py`

```bash
cd api-snippets/tools/automation/twiml-generator
mkdir lib
mv ~/Downloads/twilio-7.11.0-jar-with-dependencies.jar lib/
```

### C#

You need mono installed on your machine and three dll in a `lib` directory beside `generator.py`
1. (Twilio.dll)(https://www.nuget.org/packages/Twilio/)
1. (Newtonsoft.Json.dll)(https://www.nuget.org/packages/Newtonsoft.Json/)
1. (JWT.dll)(https://www.nuget.org/packages/JWT/)

```bash
cd api-snippets/tools/automation/twiml-generator
mv ~/Downloads/twilio.5.5.0.nupkg .
mv ~/Downloads/newtonsoft.json.10.0.2.nupkg .
mv ~/Downloads/jwt.2.4.2.nupkg .
unzip *.nupkg
```

## How to run

```bash
usage: generator.py [-h] [-l {csharp,java,node,php,python}] [-t]
                    root_twiml_filepath

positional arguments:
  root_twiml_filepath   Path to a directory containing TwiML file

optional arguments:
  -h, --help            show this help message and exit
  -l {csharp,java,node,php,python}, --languages {csharp,java,node,php,python}
                        Languages for the code to generate (default: all)
  -t, --test            Test the snippet against the input
```

`root_twiml_filepath` will be scanned recursively for any `.xml` files and generate the code samples in the parent directory (we expect them to be placed in an `output` directory).
`--languages` can be used if you want to generate code for specific languages.

For example, to generate all Java snippets under __/twiml/message__:
```bash
./generator.py ../../../twiml/message -l java
```
