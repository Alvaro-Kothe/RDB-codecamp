require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require("body-parser")

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));
app.use(bodyParser.urlencoded({extended: false}))

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});

const longToShortMap = new Map()
const shortToLongMap = new Map()
let lastId = 0;

function getNewId() {
  return ++lastId;
}

app.post("/api/shorturl", function (req, res) {
  const originalUrl = req.body.url
  const urlPattern = /(?:https?):\/\/(\w+:?\w*)?(\S+)(:\d+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;
  const urlIsInvalid = !urlPattern.test(originalUrl)
  if (urlIsInvalid) {
    return res.json({ error: 'invalid url' })
  }

  if (!longToShortMap.has(originalUrl)) {
    const newId = getNewId()
    longToShortMap.set(originalUrl, newId)
    shortToLongMap.set(newId, originalUrl)
  }

  res.json({ original_url: originalUrl, short_url: longToShortMap.get(originalUrl) });
})

app.get('/api/shorturl/:shortUrl', (req, res) => {
  const shortUrl = parseInt(req.params.shortUrl);

  if (!shortToLongMap.has(shortUrl)) {
    return res.json({"error":"No short URL found for the given input"})
  }
  
  res.redirect(shortToLongMap.get(shortUrl));
});