require("sinatra/activerecord")
require("sinatra/activerecord/rake")

namespace(:db) do
  task(:load_config)
end

# run 'rake db:create' in command line to create databases defined in 'database.yml'
  # 'rake db:create' is same as psql 'CREATE DATABASE survey_development;' and 'CREATE DATABASE survey_test;'

# migrate (create/change) tables to database by command line 'rake db:create_migration NAME=create_surveys'
  # after above  first 'create_migration', folders 'db/migrate' are created with files of new tables
  # migrations create new files inside folder 'migrate'
