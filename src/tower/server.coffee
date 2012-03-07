require 'underscore.logger'

global._ = require 'underscore'
_.mixin(require('underscore.string'))

module.exports  = global.Tower = Tower = {}

Tower.logger    = _console

require './support'
require './application'
require './server/application'
require './store'
require './server/store'
require './model'
require './view'
require './controller'
require './server/controller'
require './http'
require './middleware'
require './server/middleware'
require './server/command'
require './server/generator'

Tower.Model.defaultStore  = Tower.Store.MongoDB
Tower.View.store(new Tower.Store.FileSystem(["app/views"]))
Tower.root                = process.cwd()
Tower.publicPath          = process.cwd() + "/public"
Tower.publicCacheDuration = 60 * 1000
Tower.sessionSecret       = "tower-session-secret"
Tower.cookieSecret        = "tower-cookie-secret"
Tower.render              = (string, options = {}) ->
  require("mint").render(options.type, string, options)
  
Tower.domain              = "localhost"

Tower.date = ->
  require('moment')(arguments...)._d

Tower.run = (argv) ->
  (new Tower.Command.Server(argv)).run()

