
# ActiveRecord contains methods like 'all', 'save', 'delete', 'new', '@ attributes';
# AR makes the code dry:

class Question < ActiveRecord::Base
  belongs_to(:survey)

end
