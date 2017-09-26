require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")     #needs to load before lib files b/c ActiveRecord contains base class for all classes
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require("pg")

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post("/") do
  name = params.fetch("name")
  survey = Survey.new({:name => name, :id => nil})
  survey.save
  @surveys = Survey.all()
  erb(:index)
end
