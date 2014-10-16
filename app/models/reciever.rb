class Reciever < ActiveRecord::Base
  belongs_to :email
  belongs_to :mailbox
end