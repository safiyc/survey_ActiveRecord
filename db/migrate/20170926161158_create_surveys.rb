# this file is to create/modify this specific 'surveys' table
# class 'CreateSurveys' automatically created after running 'rake db:create_migration NAME=create_surveys'
class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|     # 't' can mean 'table'
      t.column(:name, :string)

      t.timestamps()
    end
  end
end

# after above method(s) defined or updates, run:
  # 'rake db:migrate'
  # 'rake db:test:prepare' to mirror changes in test database
