const express = require('express');

const port = process.env.PORT || 8000;
const app = express();

app.get('/', (request, response) => response.send('Hello word!'));
app.listen(port, () => console.log(`Our app is up and running on port ${port}!`));

module.exports = {
  app,
  port,
};
