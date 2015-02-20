require "minitest/autorun"
require "rack/test"
require "corsair"

describe Rack::Corsair do
  include Rack::Test::Methods

  def app
    app = Rack::Builder.new do
      map "/things/1" do
        run proc { [200, { "Content-Type" => "application/json" }, "{ \"status\": 200 }"] }
      end
      map "/things/1000" do
        run proc { [404, { "Content-Type" => "application/json" }, "{ \"status\": 404 }"] }
      end
    end.to_app

    Rack::Corsair.new(app)
  end

  it "gets access-control-allow-origin header on a 200" do
    get "/things/1"
    assert_equal last_response.original_headers["Access-Control-Allow-Origin"], "*"
  end

  it "gets access-control-allow-origin header on a 404" do
    get "/things/1000"
    assert_equal last_response.original_headers["Access-Control-Allow-Origin"], "*"
  end
end
