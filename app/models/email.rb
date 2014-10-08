class Email < ActiveRecord::Base
  # FIXME_AK: Reorder the statements.
  # FIXME_AK: Clashing of the associations.
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  # FIXME_AK: name must be pluralized here.
  has_and_belongs_to_many :mailbox
  # FIXME_AK: do we need to preserve the attachments when email is destroyed?
  has_many :attachments
  validate :number_of_emails
  before_save :subject_empty
  validates :subject, numericality: {less_than_or_equal_to: max}
  before_save :check_for_spam
  after_save :add_contact

  def add_contact
  end

  def check_for_spam
    # FIXME_AK: Refactor this method.
    # FIXME_AK: no need for self.
    if self.attachments.any? {|att| att.type == 'Audio'}
      self.tag = 'spam'
    else
      self.tag = 'normal'
    end
  end

  def subject_empty
    # FIXME_AK: naming for the method.
    # FIXME_AK: retturn value.
    if subject.nil?
      errors.add 'no subject was given'
    end
  end

  # FIXME_AK: naming.
  # FIXME_AK: ditto for above.
  def number_of_reciepients
    if mailbox.size > 0
      errors.add 'max number of reciepients limit reached'
    end
  end

  def number_of_emails
    mb = Mailbox.find_by_id(self.sender_mailbox_id)
    if mb.number_of_mails_send > 10
      errors.add 'max limit reached'
    else
      Mailbox.increment_counter(:number_of_mails_send, mb.id)
    end
  end

end
