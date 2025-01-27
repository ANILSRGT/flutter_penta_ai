const fs = require("fs");
const path = require("path");

if (process.argv.length < 5) {
  console.error("\x1b[31m" + "Error - Missing arguments:" + "\x1b[0m");
  console.log("\x1b[32m" + "Usage: node lang.js <input_folder> <output_folder> <output_class>" + "\x1b[0m");
  console.warn(
    "\x1b[33m" + "Example: node lang.js assets/language lib/core/constants/localization LocaleKeys" + "\x1b[0m"
  );
  process.exit(1);
}

// ex.: assets/language
const inputFolder = `../${process.argv[2]}`;
// ex.: lib/core/constants/localization
const outputFolder = `../${process.argv[3]}`;
// ex.: LocaleKeys
const outputClass = process.argv[4];
const outputFile =
  outputClass
    .replace(/([A-Z])/g, "_$1")
    .toLowerCase()
    .slice(1) + ".g.dart";

if (!fs.existsSync(path.join(__dirname, inputFolder))) {
  console.error("Input folder not found: " + inputFolder);
  process.exit(1);
}

const inputFolderPath = path.join(__dirname, inputFolder);
const outputFilePath = path.join(__dirname, outputFolder, outputFile);
const inputFiles = fs.readdirSync(inputFolderPath);

if (inputFiles.filter(file => file.endsWith(".json")).length === 0) {
  console.error("Input folder does not contain any JSON file: " + inputFolder);
  process.exit(1);
}

const inputFilePath = path.join(inputFolderPath, inputFiles[0]);
const inputJson = JSON.parse(fs.readFileSync(inputFilePath, "utf8"));

const joinChar = ".";

console.clear();
console.log("Generating Dart code...");

String.prototype.isMatch = function (s) {
  return this.match(s) !== null;
};

langCodeGenJs = function (json, prefix = "") {
  const constants = {};

  for (const key in json) {
    if (typeof json[key] === "object") {
      const nestedConstants = langCodeGenJs(json[key], prefix + key + joinChar);
      Object.assign(constants, nestedConstants);
    } else {
      const toKey = prefix ? prefix + key : key;
      const constantKey = toKey
        .split(joinChar)
        .map((s, i) => (i === 0 ? s : s[0].toUpperCase() + s.slice(1)))
        .join("");
      constants[constantKey] = { key: toKey, value: json[key] };
    }
  }

  return constants;
};

const constants = langCodeGenJs(inputJson);

const dartCode =
  "// GENERATED CODE - DO NOT MODIFY BY HAND\n\n" +
  `final class ${outputClass} {\n` +
  `\t${outputClass}._();\n\n` +
  Object.keys(constants)
    .map(key => {
      const args = [...constants[key].value.matchAll(/{([^}]*)}/g)];
      const argsCount = args.length;
      return `\tstatic String get ${key}${argsCount > 0 ? `Args${argsCount}` : ""} => '${constants[key].key}';`;
    })
    .join("\n") +
  "\n}";

fs.mkdirSync(path.dirname(outputFilePath), { recursive: true });
fs.writeFileSync(outputFilePath, dartCode);

console.log("Dart code generated successfully");
console.log("Output file: " + outputFilePath);
