require "rack-accept_router/version"

require 'cgi'

module Rack
  class AcceptRouter
    def initialize(app, map)
      @map = map
      @app = app
    end
    def call(env)
      path = env["PATH_INFO"]
      if version = Array(CGI.parse(env["HTTP_ACCEPT"])["version"]).first
        version = version.to_i
      end

      if version &&
          (key = @map.keys.find{|k| k.match(path)}) &&
          (responder = @map[key][version])
        responder.call(env)
      else
        @app.call(env)
      end
    end
  end
end
