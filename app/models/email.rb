class Email < ActiveRecord::Base
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  has_and_belongs_to_many :mailbox
  has_many :attachments
  validate :number_of_emails
  before_save :subject_empty
  validate do
    range less_than_or_equal_to: max
  end
  validate :number_of_reciepients
  before_save :check_for_spam
  after_save :add_contact

  def add_contact
    debugger
  end

  def check_for_spam
    if self.attachments.any? {|att| att.type == 'Audio'}
      self.tag = 'spam'
    else
      self.tag = 'normal'
    end
  end

  def subject_empty
    if subject.nil?
      errors.add 'no subject was given'
    end
  end

  def range(hash)
    self.class.validates :subject, numericality: hash
  end

  def number_of_reciepients
    if mailbox.size > 0
      errors.add 'max number of reciepients limit reached'
    end
  end

  def number_of_emails
    mb = Mailbox.find_by_id(self.sender_mailbox_id)
    debugger
    if mb.number_of_mails_send > 10
      errors.add 'max limit reached'
    else
      Mailbox.increment_counter(:number_of_mails_send, mb.id)
    end
  end

end
