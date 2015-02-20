module Rack
  class Corsair
    def initialize(app, &block)
      @app = app
      @origin = "*"
      @resources = []
      block.call(self) if block_given?
    end

    def call(env)
      req = Rack::Request.new(env)
      status, headers, response = @app.call(env)

      if resource_allowed?(req)
        [status, headers.merge(cors_headers), response]
      else
        [status, headers, response]
      end
    end

    def allow_origin(origin)
      @origin = origin
    end

    def allow_resource(resource)
      @resources << resource.to_s
    end

    private

    def resource_allowed?(req)
      return true if @resources.empty?
      resource = req.env["PATH_INFO"].split("/")[1]
      @resources.include?(resource)
    end

    def cors_headers
      {
        "Access-Control-Allow-Origin" => @origin
      }
    end
  end
end
