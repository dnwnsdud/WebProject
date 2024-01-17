module.exports = () => {
  const fs = require("fs");

  return [
    fs.readFileSync("./json/jsonAni3.json", "utf-8"),
    fs.readFileSync("./json/jsonMovie21.json", "utf-8"),
    fs.readFileSync("./json/jsonPerson4.json", "utf-8"),
    fs.readFileSync("./json/jsonPerson14.json", "utf-8"),
  ];
};
