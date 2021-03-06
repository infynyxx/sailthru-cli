commander = require 'commander'
{createSailthruConsole} = require './sailthru-console'
{parseConfigFile} = require './util'

VERSION = '0.0.4'

exports.VERSION = VERSION

exports.main = ->
    commander
        .version(VERSION)
        .option('-k, --key [value]', 'API Key')
        .option('-s, --secret [value]', 'API Secret')
        .option('-u, --url [value]', 'API URL')
        .option('-c, --config [value]', 'Config File')
        .parse(process.argv)

    options = {}

    options = parseConfigFile commander.config if commander.config

    process.exit 0 if options is false
    
    options.apiKey = commander.key if commander.key
    options.apiSecret = commander.secret if commander.secret
    options.apiUrl = commander.url if commander.url

    #console.log options
    
    createSailthruConsole(options).initialize()
