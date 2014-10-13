# FIXME_AK: Whta is the purpose of inheritance_column? fixed
class Attachment < ActiveRecord::Base
  belongs_to :email
end
