module.exports = (app) => {
  app.all("/movie", (req, res, next) => {
    try {
      let keys = Object.keys(req.parameter);
      for (let key of keys) {
        let lowkey = key.toLowerCase();
        let datalowkey = lowkey.replace(/^\d/, "");
        if (datalowkey === "audits" || datalowkey === "movienm") {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey].toLowerCase().indexOf(elem.toLowerCase()) >
                  -1
              ) !== undefined
          );
        } else if (
          datalowkey === "movieid" ||
          datalowkey === "moviecd" ||
          datalowkey === "tmdbid"
        ) {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) => data[datalowkey] === elem
              ) !== undefined
          );
        } else if (datalowkey === "nation" || datalowkey === "genre") {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey + "s"] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey + "s"].find(
                    (delem) =>
                      delem[datalowkey + "nm"]
                        .toLowerCase()
                        .indexOf(elem.toLowerCase()) > -1
                  ) !== undefined
              ) !== undefined
          );
        } else if (
          datalowkey === "directornm" ||
          datalowkey === "actornm" ||
          datalowkey === "staffnm"
        ) {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey.slice(0, -2) + "s"] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey.slice(0, -2) + "s"].find(
                    (delem) =>
                      delem.peoplenm.toLowerCase().indexOf(elem.toLowerCase()) >
                      -1
                  ) !== undefined
              ) !== undefined
          );
        } else if (
          datalowkey === "directornmen" ||
          datalowkey === "actornmen" ||
          datalowkey === "staffnmen"
        ) {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey.slice(0, -4) + "s"] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey.slice(0, -4) + "s"].find(
                    (delem) =>
                      delem.peoplenmen
                        .toLowerCase()
                        .indexOf(elem.toLowerCase()) > -1
                  ) !== undefined
              ) !== undefined
          );
        } else if (datalowkey === "directorid" || datalowkey === "actorid") {
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey.slice(0, -2) + "s"] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey.slice(0, -2) + "s"].find(
                    (delem) => delem.peopleid === elem
                  ) !== undefined
              ) !== undefined
          );
        } else if (datalowkey === "keywords")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey].find(
                    (delem) =>
                      delem.toLowerCase().indexOf(elem.toLowerCase()) > -1
                  ) !== undefined
              ) !== undefined
          );
        else if (datalowkey === "year")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getFullYear() === req.parameter[lowkey][0]
          );
        else if (datalowkey === "month")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getMonth() + 1 === req.parameter[lowkey][0]
          );
        else if (datalowkey === "day")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getDate() === req.parameter[lowkey][0]
          );
        else if (datalowkey === "under_year")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getFullYear() <= req.parameter[lowkey][0]
          );
        else if (datalowkey === "under_month")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getMonth() + 1 <= req.parameter[lowkey][0]
          );
        else if (datalowkey === "under_day")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getDate() <= req.parameter[lowkey][0]
          );
        else if (datalowkey === "over_year")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getFullYear() >= req.parameter[lowkey][0]
          );
        else if (datalowkey === "over_month")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getMonth() + 1 >= req.parameter[lowkey][0]
          );
        else if (datalowkey === "over_day")
          req.Movie.movielist = req.Movie.movielist.filter(
            (data) => data.opendt.getDate() >= req.parameter[lowkey][0]
          );
      }
      res.json(req.Movie);
    } catch (e) {
      next(new Error("Movie Error"));
    }
  });
};
