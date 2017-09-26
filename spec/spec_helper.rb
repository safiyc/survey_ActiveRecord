ENV['RACK_ENV'] = 'test'      #this is to make sinatra run tests on the test database
require('rspec')
require('pg')
require("sinatra/activerecord")
require('survey')
require('question')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
     survey.destroy()
  end
end
end
