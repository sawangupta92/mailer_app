class Contact < ActiveRecord::Base
  belongs_to :friend, class_name: 'Mailbox'
end
