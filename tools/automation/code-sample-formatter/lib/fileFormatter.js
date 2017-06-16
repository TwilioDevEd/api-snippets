const readline = require('readline');
const fs = require('fs');
const path = require("path");

const MAX_LINE_LENGTH = 80;
let tabString;

// Go through all lines in a file, formatting them if needed and appending
// them to a temporary file. When done, replaces the original file with the
// temporary one
function formatFile(file, tabSize = 4) {
  tabString = Array(parseInt(tabSize) + 1).join(" ");
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
      fs.appendFileSync(folder + 'output.tmp', newLine + "\n");
    })
  });

  rl.on('close', () => {
    console.log(`${neededFormatting ? "Formatted" : "No formatting needed for"} ${file}`);
    fs.renameSync(folder + 'output.tmp', file);
  });
}

// Recursive function taking one line as an input and returning and array of lines
// broken down below a MAX_LINE_LENGTH and according to Java, C# and PHP standards
function trimLine(line, lines) {
  const relativeMaxLineLength = getLineMaxLength(lines, line);
  if(line.length > relativeMaxLineLength) {
    let lastBreakingChar = relativeMaxLineLength;
    let previousLastBreakingChar;
    let trimmedLine = line;
    do {
      trimmedLine = trimmedLine.substring(0, lastBreakingChar);
      previousLastBreakingChar = lastBreakingChar;
      lastBreakingChar = getLastBreakingChar(trimmedLine);
    } while(lastBreakingChar > 0 &&
      lastBreakingChar != previousLastBreakingChar &&
      !isBreakingCharOutsideQuotes(trimmedLine, lastBreakingChar));

    if(!isBreakingCharOutsideQuotes(line, lastBreakingChar) || lastBreakingChar <= 0) {
      storeCurrentLine(lines, line);
      return lines;
    }

    if(line.charAt(lastBreakingChar) == ',') {
      lastBreakingChar++;
    }

    storeCurrentLine(lines, line.substring(0, lastBreakingChar));

    return trimLine(line.substring(lastBreakingChar, line.length).trim(), lines);
  } else {
    storeCurrentLine(lines, line);
    return lines;
  }
}

function storeCurrentLine(lines, line) {
  lines.push(tabLineIfNeeded(lines, line));
}

// Normalize max line length for different line indentations
function getLineMaxLength(lines, line) {
  return lines.length == 0 ? MAX_LINE_LENGTH : MAX_LINE_LENGTH - getTab(lines[0]).length;
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

function tabLineIfNeeded(lines, line) {
  return lines.length > 0 ? getTab(lines[0]) + line : line;
}

// Get tab spaces considering already formatted lines
function getTab(line) {
  const baseTab = line.match(/^ */);
  return line.trim().charAt(0) == "." ? baseTab : baseTab + tabString;
}

module.exports.formatFile = formatFile;
module.exports.trimLine = trimLine;
