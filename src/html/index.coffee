View = require 'teacup-view'

module.exports = new View (options) ->
  @doctype 5
  @html =>
    @body =>
      @h1 'Hello, Teacup!'
