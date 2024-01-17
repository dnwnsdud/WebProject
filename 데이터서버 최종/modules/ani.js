module.exports = (app) => {
  app.all("/ani", (req, res, next) => {
    try {
      let keys = Object.keys(req.parameter);
      for (let key of keys) {
        let lowkey = key.toLowerCase();
        let datalowkey = lowkey.replace(/^\d/, "");
        if (
          datalowkey === "nation" ||
          datalowkey === "production" ||
          datalowkey === "type" ||
          datalowkey === "medium" ||
          datalowkey === "overview" ||
          datalowkey === "content_rating" ||
          datalowkey === "original_name" ||
          datalowkey === "season" ||
          datalowkey === "name"
        ) {
          req.Ani.anilist = req.Ani.anilist.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) =>
                  data[datalowkey].toLowerCase().indexOf(elem.toLowerCase()) >
                  -1
              ) !== undefined
          );
        } else if (
          datalowkey === "id" ||
          datalowkey === "is_adult" ||
          datalowkey === "lafid" ||
          datalowkey === "tmdbid"
        ) {
          req.Ani.anilist = req.Ani.anilist.filter(
            (data) =>
              data[datalowkey] !== undefined &&
              req.parameter[lowkey].find(
                (elem) => elem === data[datalowkey]
              ) !== undefined
          );
        } else if (
          datalowkey === "genres" ||
          datalowkey === "main_tags" ||
          datalowkey === "air_year_quarter"
        ) {
          req.Ani.anilist = req.Ani.anilist.filter(
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
        }
      }
      res.json(req.Ani);
    } catch (e) {
      next(new Error("Ani Error"));
    }
  });
};
