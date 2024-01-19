module.exports = () => {
  const fs = require("fs");

  return [
    fs.readFileSync("./json/jsonAni4.json", "utf-8"),
    fs.readFileSync("./json/jsonMovie22.json", "utf-8"),
    fs.readFileSync("./json/jsonPerson4.json", "utf-8"),
    fs.readFileSync("./json/jsonPerson14.json", "utf-8"),
  ];
};
