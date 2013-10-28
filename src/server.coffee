express = require 'express'
fs = require 'fs'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
passport = require "passport"
flash = require "connect-flash"

env = process.env.NODE_ENV ? 'development'
config = require('./config')[env]

app = express()

app.get '/hello.txt', (req, res) ->
    res.send 'Hello World'

app.listen 3000
console.log 'Listening on port 3000'
