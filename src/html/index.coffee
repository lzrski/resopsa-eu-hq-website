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
      @nav
        class : "navbar navbar-default navbar-fixed-top topnav"
        role  : "navigation"
        =>
          @div class: "container topnav", =>
            # Brand and toggle get grouped for better mobile display
            @div class: "navbar-header", =>
              @button
                type  : "button"
                class : "navbar-toggle"
                data  :
                  toggle: "collapse"
                  target: "#bs-example-navbar-collapse-1"
                =>
                  @span class: "sr-only", "Toggle navigation"
                  @span class: "icon-bar"
                  @span class: "icon-bar"
                  @span class: "icon-bar"

              @a class: "navbar-brand topnav", href: "#", "Responsa.eu"

            @div
              class : "collapse navbar-collapse"
              id    : "bs-example-navbar-collapse-1"
              =>
                @ul class: "nav navbar-nav navbar-right", =>
                  @li => @a href: "#about",   "About our project"
                  @li => @a href: "#portals", "National portals"
                  @li => @a href: "#contact", "Contact"

      @div class: 'intro-header', =>
        @div clas: 'container', =>
          @div class: 'row', =>
            @div
              # In the middle:
              class: [
                'col-md-6'
                'col-md-offset-3'

                'col-sm-8'
                'col-sm-offset-2'

                'col-xs-10'
                'col-xs-offset-1'
              ].join ' '
              =>
                @div class: 'intro-message', =>
                  @img
                    class : 'logo'
                    src   : 'img/responsa-eu-negative.svg'
                    alt   : 'Responsa.eu - about the law'
