const recursive = require("recursive-readdir");
const path = require("path");
const formatFile = require('./lib/fileFormatter').formatFile;

const relativeSnippetFolder = process.argv[2] == '.' ? "" : process.argv[2];
const absoluteSnippetFolder = __dirname + "/../../../" + relativeSnippetFolder;
const extension = process.argv[3];

recursive(absoluteSnippetFolder,
    [(path, stats) => {
      return !stats.isDirectory() && !path.includes(extension);
    }],
    (err, files) => {
      files.forEach((file) => {
        formatFile(file);
      })
    });
