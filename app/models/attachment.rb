class Attachment < ActiveRecord::Base
  belongs_to :email
  self.inheritance_column = :type
end
