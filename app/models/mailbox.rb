class Mailbox < ActiveRecord::Base
  # FIXME_AK: Do we need to preserve contacts when mailbox is destroyed? done
  has_many :contacts, dependent: :destroy
  # FIXME_AK: donot use habtm.
  has_and_belongs_to_many :emails
  has_many :mailboxes, through: :contacts, source: :friend, as: :contact

  before_destroy :check_for_spam

  def check_for_spam
    # FIXME_AK: Refactor this method done
    emails.all? { |em| em.tag == 'spam' }
  end

end
