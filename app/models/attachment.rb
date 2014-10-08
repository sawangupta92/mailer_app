# FIXME_AK: Whta is the purpose of inheritance_column?
class Attachment < ActiveRecord::Base
  belongs_to :email
  self.inheritance_column = :type
end
