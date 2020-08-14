require 'rspec/core'
require 'hatchet'
require 'fileutils'
require 'hatchet'
require 'rspec/retry'
require 'date'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

describe "sscce" do
  context "context" do
    it "breaks" do
      Hatchet::Runner.new("java-overlay-test", buildpacks: ["heroku/java"], stack: "heroku-18").tap do |app|
        app.deploy do
          value1 = app.run("md5sum .jdk-overlay/jre/lib/security/cacerts")
          value2 = app.run("md5sum .jdk-overlay/jre/lib/security/cacerts")

          expect(value1).to eq(value2)
        end
      end
    end
  end
end
