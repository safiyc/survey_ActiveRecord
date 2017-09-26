# ActiveRecord contains methods like 'all', 'save', 'delete', 'new', '@ attributes';
# AR makes the code dry:

class Survey < ActiveRecord::Base
  before_save(:upcase_name)

private

  def upcase_name
    self.name=(name().upcase())
  end
end
