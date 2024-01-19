module.exports = () => {
  const express = require("express");
  const app = express({ xPoweredBy: false });

  const [Ani, Movie, Director, Actor] = require("./read")();

  const reviver = (key, value, islist = false) => {
    if (islist) {
      if (/^\[.*\]$/.test(value))
        return value
          .slice(1, -1)
          .split(",")
          .map((data) => data.trim())
          .flatMap((data) => reviver(key, data, islist));
    }
    if (typeof value !== "string") return islist ? [value] : value;
    if (key.slice(-2) !== "cd" && /^\d+$/.test(value))
      return islist ? [parseInt(value)] : parseInt(value);
    if (/^\d*\.\d*$/.test(value))
      return islist ? [parseFloat(value)] : parseFloat(value);
    if (/^true$/i.test(value)) return islist ? [true] : true;
    if (/^false$/i.test(value)) return islist ? [false] : false;
    // if (/^$/.test(value) || /^null$/i.test(value))
    //   return islist ? [null] : null;
    if (/^\d{4}-\d{1,2}-\d{1,2}$/.test(value))
      return islist ? [new Date(value)] : new Date(value);
    return islist ? [value] : value;
  };
  const standard = (obj, islist = false) => {
    let result = {};
    for (let key in obj) {
      let value = obj[key];
      let lowkey = key.toLowerCase();
      if (typeof value === "object" && value !== null) {
        if (!Array.isArray(value)) result[lowkey] = standard(value, islist);
        else {
          result[lowkey] = value;
          for (let k in value)
            result[lowkey][k] =
              typeof value[k] === "object" && value !== null
                ? standard(value[k], islist)
                : reviver(lowkey, value[k], islist);
        }
      } else result[lowkey] = reviver(lowkey, value, islist);
    }
    return result;
  };
  app.use(express.json());
  app.use((req, res, next) => {
    req.Ani = standard(JSON.parse(Ani));
    req.Movie = standard(JSON.parse(Movie));
    req.Director = standard(JSON.parse(Director));
    req.Actor = standard(JSON.parse(Actor));
    // req.Person = {
    //   persons: [
    //     ...standard(JSON.parse(Director)).directors,
    //     ...standard(JSON.parse(Actor)).actors,
    //   ],
    // };
    let parameter = standard({ ...req.body, ...req.query }, true);
    req.parameter = {};
    for (let key in parameter) {
      if (
        typeof parameter[key][0] === "object" &&
        Array.isArray(parameter[key][0])
      ) {
        let i = 0;
        for (let value of parameter[key]) req.parameter[++i + key] = [...value];
      } else req.parameter[key] = [...parameter[key]];
    }
    next();
  });

  require("./ani")(app);
  require("./movie")(app);
  require("./director")(app);
  require("./actor")(app);

  app.use((err, req, res, next) => {
    res.json({ message: err.message });
  });

  app.listen(process.env.PORT, () => {});
};
