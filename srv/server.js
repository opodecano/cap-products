const createHandler = require('graphql-http');
const cds = require("@sap/cds");
const cors = require("cors");
const adapterProxy = require("@cap-js-community/odata-v2-adapter");
const schema = require("@graphql-tools/schema");


cds.on("bootstrap", (app) => {
  app.use(adapterProxy());
  app.use(cors());
  app.all('/graphql', createHandler({ schema }));
  app.get("/alive", (_, res) => {
    res.status(200).send("Server is Alive");
  });
});

if (process.env.NODE_ENV !== "production") {
  const swagger = require("cds-swagger-ui-express");

  cds.on("bootstrap", (app) => {
    app.use(swagger());
  });
  require("dotenv").config();
}

module.exports = cds.server;
