const readline = require('readline');
const fs = require('fs');
const path = require("path");


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
  });
}

function trimLine(line, lines) {
  if(line.length > 80) {
    const trimmedLine = line.substring(0, 80);
    const lastBreakingChar = getLastBreakingChar(trimmedLine);
    const secondToLastBreakingChar = getLastBreakingChar(line.substring(0, lastBreakingChar - 1));
    const isDoubleQuoteCountEven = (line.substring(0, lastBreakingChar).match(/[^\\]"/gi) || []).length % 2 == 0;
    const lastQuote = getLastQuote(trimmedLine);

    let splitLineIndex;
    if(isDoubleQuoteCountEven && lastBreakingChar > 0) {
      splitLineIndex = lastBreakingChar;
    } else if(!isDoubleQuoteCountEven && secondToLastBreakingChar > 0) {
      splitLineIndex = secondToLastBreakingChar;
    } else {
      lines.push(line);
      return lines;
    }
    if(line.charAt(splitLineIndex) == ',') {
      splitLineIndex++;
    }
    if(line === line.substring(splitLineIndex, line.length)) {
      process.exit();
    }
    lines.push(line.substring(0, splitLineIndex));
    return trimLine(line.substring(splitLineIndex, line.length).trim(), lines);
  } else {
    lines.push(line);
    return lines;
  }
}

function isEvenNumberOfCharacters(line, char) {
  const regex = new RegExp(char);
  return (line.match(regex) || []).length % 2 == 0;
}

function getLastBreakingChar(line) {
  return Math.max(line.lastIndexOf("."), line.lastIndexOf(","));
}

function getLastQuote(line) {
  return Math.max(line.lastIndexOf("'"), line.lastIndexOf('"'));
}

function tabPlus(line) {
  return line.match(/^ */) + "    ";
}

module.exports.formatFile = formatFile;
module.exports.trimLine = trimLine;
