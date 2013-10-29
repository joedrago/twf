express = require 'express'
fs = require 'fs'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
passport = require "passport"
flash = require "connect-flash"

env = process.env.NODE_ENV ? 'development'
config = require('./config')[env]

mongoose.connect(config.db);

userSchema = mongoose.Schema {
    name: String
}
User = mongoose.model 'User', userSchema
User.find { name: 'derp' }, (err, users) ->
    console.log "found #{users.length} guys"
    console.log "guy: #{guy.name}" for guy in users
    if users.length == 0
        derp = new User { name: 'derp' }
        derp.save (err, derp) ->
            console.log err if err


app = express()

app.get '/hello.txt', (req, res) ->
    res.send 'Hello World'

port = process.env.PORT ? 3000
app.listen port
console.log "Listening on port #{port}"
