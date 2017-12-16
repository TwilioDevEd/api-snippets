const recursive = require('recursive-readdir');
const path = require('path');
const formatFile = require('./lib/fileFormatter').formatFile;

const ArgumentParser = require("argparse").ArgumentParser;
const parser = new ArgumentParser({
  version: '0.0.1',
  addHelp:true,
  description: 'Code formatter for C#, Java and PHP'
});
parser.addArgument(['-r', '--root-path'], {
    help: 'Root directory path to scan recursively (relative to api-snippets root)',
    required: false
});
parser.addArgument(['-e', '--extension'], {
    help: 'File extension to format',
    required: false
});
parser.addArgument(['-f', '--file'], {
    help: 'Specific file path to format',
    required: false
});
parser.addArgument(['-t', '--tab-size'], {
    help: 'Line indentation specified in number of spaces. Default value is 4',
    required: false
});

const args = parser.parseArgs();

if (args.file) {
    formatFile(args.file, args.tab_size);
} else {
    const relativeSnippetFolder = args.root_path;
    const absoluteSnippetFolder = __dirname + "/../../../" + relativeSnippetFolder;
    const extension = process.argv[3];

    recursive(absoluteSnippetFolder,
        [(path, stats) => {
          return !stats.isDirectory() && !path.includes(args.extension);
        }],
        (err, files) => {
          files.forEach((file) => {
            formatFile(file, args.tab_size);
          })
        });
}
