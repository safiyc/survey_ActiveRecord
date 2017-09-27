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


get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

get("/surveys/:id/edit") do
  @survey =  Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

# this is to change survey name
patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  erb(:survey)
end

delete("/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  @surveys = Survey.all
  erb(:index)
end

# this is to create questions
post("/surveys/:id") do
  name = params.fetch("name")
  survey_id = params.fetch("survey_id").to_i()
  @survey = Survey.find(survey_id)
  Question.create({:name => name, :survey_id => survey_id})
  erb(:survey)
end
