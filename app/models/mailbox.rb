class Mailbox < ActiveRecord::Base
  has_many :contacts
  has_and_belongs_to_many :emails
  has_many :mailboxes, through: :contacts, source: :friend, as: :contact
  before_destroy :check_for_spam

  def check_for_spam
    if self.emails.none? {|em| em.tag != 'spam' }
      false
    end
  end

end
