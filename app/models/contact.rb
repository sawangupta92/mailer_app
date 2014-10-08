class Contact < ActiveRecord::Base
  # FIXME_AK: no need for single quotes.
  belongs_to :friend, class_name: 'Mailbox'
end
