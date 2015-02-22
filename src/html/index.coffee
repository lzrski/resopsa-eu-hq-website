View = require 'teacup-view'

module.exports = new View (options) ->
  @doctype 5
  @html lang: 'en', =>
    @head =>
      @title "Responsa.eu"

      @meta charset :"utf-8">
      @meta 'http-equiv': "X-UA-Compatible", content: "IE=edge"
      @meta
        name    : "viewport"
        content : "width=device-width, initial-scale=1"
      @meta
        name    : "description"
        content : "Responsa.eu project"
      @meta
        name    : "author"
        content : "Responsa.eu team"

      @link href: url, rel: 'stylesheet', type: "text/css" for url in [
        "css/bootstrap.min.css"
        "css/landing-page.css"
        "font-awesome/css/font-awesome.min.css"
        # TODO: use protocol relative url
        "http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
      ]


      # HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
      # WARNING: Respond.js doesn't work if you view the page via file://
      @ie 'lt IE9', => @script src: url for url in [
        "https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"
        "https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"
      ]

    @body =>
      @h1 'Hello, Teacup!'
