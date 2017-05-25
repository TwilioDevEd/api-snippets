const fs = require('fs');
const readline = require('readline');
const recursive = require("recursive-readdir");
const path = require("path");

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

function formatFile(file) {
  const rl = readline.createInterface({
    input: fs.createReadStream(file)
  });
  const folder = file.replace(path.basename(file), "");
  let neededFormatting = false;

  rl.on('line', (line) => {
    const lines = trimLine(line, []);
    if(lines.length > 1) {
      neededFormatting = true;
    }
    lines.forEach((newLine, i) => {
      const tab = i == 0 ? "" : tabPlus(line);
      fs.appendFileSync(folder + 'output.tmp', tab + newLine + "\n");
    })
  });

  rl.on('close', () => {
    console.log(`${neededFormatting ? "Formatted" : "No formatting needed for"} ${file}`);
    fs.renameSync(folder + 'output.tmp', file);
  })
}
function trimLine(line, lines) {
  if(line.length > 80) {
    const trimmedLine = line.substring(0, 80);
    const lastBreakingChar = getLastBreakingChar(trimmedLine);
    const quoteNumberBeforeBreakingCharIsEven = (line.substring(0, lastBreakingChar).match(/"/gi) || []).length % 2 == 0;
    const lastDoubleQuote = lastCharIndex(trimmedLine, "\"");
    const lastBreakingCharBeforeQuote = getLastBreakingChar(line.substring(0, lastDoubleQuote));
    let splitLineIndex;
    if( theLastBreakingCharIsNotInsideQuotes(quoteNumberBeforeBreakingCharIsEven, lastBreakingChar, lastDoubleQuote) ) {
      splitLineIndex = lastBreakingChar;
    } else if(lastBreakingCharBeforeQuote !== undefined && !quoteNumberBeforeBreakingCharIsEven) {
      splitLineIndex = lastBreakingCharBeforeQuote;
    } else {
      lines.push(line);
      return lines;
    }
    if(line === line.substring(splitLineIndex, line.length)) {
      process.exit();
    }
    lines.push(line.substring(0, splitLineIndex));
    return trimLine(line.substring(splitLineIndex, line.length), lines);
  } else {
    lines.push(line);
    return lines;
  }
}

function getLastBreakingChar(line) {
  const lastDot = lastCharIndex(line, ".") || 0;
  const lastComma = lastCharIndex(line, ",") || 0;
  return lastComma == lastDot == 0 ? undefined : (Math.max(lastDot, lastComma) + 1);
}

function theLastBreakingCharIsNotInsideQuotes(quoteNumberBeforeBreakingCharIsEven, lastBreakingChar, lastDoubleQuote) {
  return (quoteNumberBeforeBreakingCharIsEven && lastBreakingChar !== undefined) ||
      (!quoteNumberBeforeBreakingCharIsEven && lastDoubleQuote > lastBreakingChar);
}

function tabPlus(line) {
  return line.match(/^ */) + "    ";
}

function lastCharIndex(line, char) {
  const regexString = `\\${char}([^${char}]+)$`;
  const regex = new RegExp(regexString);
  const trimmedLine = line.substring(0, 80);
  if(trimmedLine.charAt(trimmedLine.length - 1) == char) {
    return trimmedLine.length - 1;
  }
  const lastOcurrence = trimmedLine.match(regex);
  return lastOcurrence != undefined ? lastOcurrence.index : undefined;
}
