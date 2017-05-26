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
    let lastBreakingChar = 80;
    let previousLastBreakingChar;
    let trimmedLine = line;
    do {
      trimmedLine = trimmedLine.substring(0, lastBreakingChar);
      previousLastBreakingChar = lastBreakingChar;
      lastBreakingChar = getLastBreakingChar(trimmedLine);
    } while(lastBreakingChar > 0 &&
      lastBreakingChar != previousLastBreakingChar &&
      !isBreakingCharOutsideQuotes(trimmedLine, lastBreakingChar));

    if(!isBreakingCharOutsideQuotes(line, lastBreakingChar) || lastBreakingChar == -1) {
      lines.push(line);
      return lines;
    }

    let splitLineIndex = lastBreakingChar;
    if(line.charAt(splitLineIndex) == ',') {
      splitLineIndex++;
    }
    if(line === line.substring(splitLineIndex, line.length)) {
      console.log("Stalled");
      process.exit();
    }
    lines.push(line.substring(0, splitLineIndex));
    return trimLine(line.substring(splitLineIndex, line.length).trim(), lines);
  } else {
    lines.push(line);
    return lines;
  }
}

function isBreakingCharOutsideQuotes(line, lastIndexOf) {
  const trimmmedLine = line.substring(0, lastIndexOf)
  const evenDoubleQuotes = isEvenNumberOfCharacters(trimmmedLine, "'");
  const evenSingleQuotes = isEvenNumberOfCharacters(trimmmedLine, '"');
  return evenSingleQuotes && evenDoubleQuotes;
}

function isEvenNumberOfCharacters(line, char) {
  const regex = new RegExp(char, 'gi');
  return (line.match(regex) || []).length % 2 == 0;
}

function getLastBreakingChar(line) {
  return Math.max(line.lastIndexOf("."), line.lastIndexOf(","));
}

function tabPlus(line) {
  return line.match(/^ */) + "    ";
}

module.exports.formatFile = formatFile;
module.exports.trimLine = trimLine;
