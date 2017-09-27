# class 'CreateQuestions' automatically created after running 'rake db:create_migration NAME=create_questions'
# note that ActiveRecord changes 'create_questions' to 'CreateQuestions'
# note that a verb is used as prefix of class name
class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |t|     # 't' can mean 'table'
      t.column(:name, :string)
      t.column(:survey_id, :integer)

      t.timestamps()
    end
  end
end
