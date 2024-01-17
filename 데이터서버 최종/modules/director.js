module.exports = (app) => {
  app.all("/director", (req, res, next) => {
    try {
      let keys = Object.keys(req.parameter);
      for (let key of keys) {
        let lowkey = key.toLowerCase();
        let datalowkey = lowkey.replace(/^\d/, "");
        if (
          datalowkey === "peoplenm" ||
          datalowkey === "peoplenmen" ||
          datalowkey === "reprolenm" ||
          datalowkey === "sex"
        ) {
          req.Director.directors = req.Director.directors.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey].toLowerCase().indexOf(elem.toLowerCase()) >
                  -1
              ) !== undefined
          );
        } else if (datalowkey === "peoplecd" || datalowkey === "peopleid") {
          req.Director.directors = req.Director.directors.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) => data[datalowkey] === elem
              ) !== undefined
          );
        } else if (datalowkey === "filmos") {
          req.Director.directors = req.Director.directors.filter((data) => {
            for (let subkey in data.filmos[0]) {
              if (
                req.parameter[lowkey].find(
                  (elem) => subkey.toLowerCase().indexOf(elem) > -1
                ) !== undefined
              )
                return true;
            }
            return false;
          });
        } else if (
          datalowkey === "movienm" ||
          datalowkey === "movieid" ||
          datalowkey === "opendt" ||
          datalowkey === "moviecd" ||
          datalowkey === "cast"
        ) {
          req.Director.directors = req.Director.directors.filter((data) => {
            for (let subkey in data.filmos[0]) {
              let result = data.filmos[0][subkey].find((filmo) => {
                return (
                  filmo[datalowkey] !== undefined &&
                  ((typeof filmo[datalowkey] === "string" &&
                    req.parameter[lowkey].find(
                      (elem) =>
                        filmo[datalowkey]
                          .toLowerCase()
                          .indexOf(elem.toLowerCase()) > -1
                    ) !== undefined) ||
                    req.parameter[lowkey].find(
                      (elem) => filmo[datalowkey] === elem
                    ) !== undefined)
                );
              });
              if (result) return true;
            }
            return false;
          });
        }
      }
      res.json(req.Director);
    } catch (e) {
      next(new Error("Director Error"));
    }
  });
};
