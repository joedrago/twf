{spawn, exec} = require 'child_process'
fs            = require 'fs'

files = [
    'src/config.coffee'
    'src/server.coffee'
]

option '-w', '--watch', 'watch for changes and rebuild/rerun accordingly'
option '-p', '--port [PORT]', 'dev server port'

coffeeName = 'coffee'
nodemonName = './node_modules/.bin/nodemon'

# This is really stupid
if process.platform == 'win32'
    coffeeName += '.cmd'
    nodemonName = '.\\node_modules\\.bin\\nodemon.cmd'

task 'build', 'build library', (options) ->
    coffee = spawn coffeeName, ['-mc' + (if options.watch then 'w' else ''), '-o', 'lib'].concat files
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()
    coffee.stderr.on 'data', (data) -> console.log data.toString().trim()

task 'dev', 'dev server, watching for build changes', (options) ->
    process.env['PORT'] = options.port ? 3000
    coffee = spawn nodemonName, ['-w', 'lib', 'lib/server.js']
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()
    coffee.stderr.on 'data', (data) -> console.log data.toString().trim()
