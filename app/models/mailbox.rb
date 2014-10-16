class Mailbox < ActiveRecord::Base
  # FIXME_AK: Do we need to preserve contacts when mailbox is destroyed? done
  has_many :contacts, dependent: :destroy
  # FIXME_AK: donot use habtm. done
  has_many :emails
  has_many :inbox_emails, class_name: Reciever
  has_many :recieved_emails, through: :inbox_emails, source: :email
  has_many :mailboxes, through: :contacts, source: :friend, as: :contact

  before_destroy :check_for_spam

  def check_for_spam
    # FIXME_AK: Refactor this method done
    emails.all? { |email| email.tag == 'spam' }
  end

end
