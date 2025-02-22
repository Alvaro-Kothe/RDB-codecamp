const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const bodyParser = require("body-parser")

app.use(cors())
app.use(express.static('public'))
app.use(bodyParser.urlencoded({ extended: false }))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});


const users = new Map()
const userLogs = new Map()
let curId = 0;

app.post("/api/users", function (req, res) {
  const { username } = req.body
  const usernameExists = Array.from(users.values()).find(user => user.username === username);
  if (usernameExists) {
    return res.json(usernameExists);
  }
  const user = { username: username, _id: (curId++).toString(16) }
  users.set(user._id, user)
  userLogs.set(user._id, [])
  return res.json(user)
})

app.get("/api/users", function (req, res) {
  res.json([...users.values()])
})

app.post("/api/users/:_id/exercises", function (req, res) {
  const _id = req.params._id
  const { username } = users.get(_id)
  let { description, duration, date } = req.body
  duration = Number(duration)
  const dateObj = date === "" || date === undefined ? new Date() : new Date(date)
  const dateStr = dateObj.toDateString()

  const log = userLogs.get(_id)
  log.push({ description, duration, date: dateStr })

  res.json({
    username, description, duration, date: dateStr, _id
  }
  )
})

app.get("/api/users/:_id/logs", function (req, res) {
  const _id = req.params._id
  let log = userLogs.get(_id)
  const { username } = users.get(_id)
  const { from, to, limit } = req.query;

  if (from) {
    const dateFrom = new Date(from);
    log = log.filter(entry => new Date(entry.date) >= dateFrom);
  }

  if (to) {
    const dateTo = new Date(to);
    log = log.filter(entry => new Date(entry.date) <= dateTo);
  }

  if (limit) {
    const limitNum = Number(limit);
    log = log.slice(0, limitNum);
  }

  res.json({
    username,
    count: log.length,
    _id,
    log
  })
})



const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})

