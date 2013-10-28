{spawn, exec} = require 'child_process'
fs            = require 'fs'

files = [
    'src/config.coffee'
    'src/server.coffee'
]

option '-w', '--watch', 'watch for changes and rebuild/rerun accordingly'

coffeeName = 'coffee'
nodemonName = 'nodemon'

# This is really stupid
if process.platform == 'win32'
    coffeeName += '.cmd'
    nodemonName = '.\\node_modules\\.bin\\nodemon.cmd'

task 'build', 'build library', (options) ->
    coffee = spawn coffeeName, ['-mc' + (if options.watch then 'w' else ''), '-o', 'lib'].concat files
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()
    coffee.stderr.on 'data', (data) -> console.log data.toString().trim()

task 'dev', 'dev server, watching for build changes', (options) ->
    console.log nodemonName
    coffee = spawn nodemonName, ['-w', 'lib', 'lib/server.js']
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()
    coffee.stderr.on 'data', (data) -> console.log data.toString().trim()
