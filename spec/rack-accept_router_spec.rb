require 'spec_helper'

describe Rack::AcceptRouter do
  describe "with one route and one app" do
    it "should route to app when version is specified" do
      requests = []
      base_application = lambda do |env|
        requests << [:base, env["PATH_INFO"]]
        [200, {"Content-Type" => "application/json"}, []]
      end
      v1_application = lambda do |env|
        requests << [:v1, env["PATH_INFO"]]
        [200, {"Content-Type" => "application/json"}, []]
      end
      app = Rack::Builder.new do
        use Rack::AcceptRouter, "/endpoint" => {1 => v1_application}
        map "/" do
          run base_application
        end
      end
      client = Rack::Client.new do
        run app
      end

      client.get("/endpoint", {"Accept" => "version=1"})

      requests.should == [[:v1, "/endpoint"]]
    end
    it "should not route to app when version is not specified"
    it "should not router to app when version does not match"
    it "should not route to app when version is specified but route does not match"
  end
end
