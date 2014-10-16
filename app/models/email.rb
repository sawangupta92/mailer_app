class Email < ActiveRecord::Base
  # FIXME_AK: Reorder the statements. done
  # FIXME_AK: Clashing of the associations. done
  belongs_to :mailbox
  # FIXME_AK: do we need to preserve the attachments when email is destroyed? done
  has_many :attachments, dependent: :destroy
  # FIXME_AK: name must be pluralized here. done
  # has_and_belongs_to_many :mailboxes
  has_many :replies, class_name: :Email
  has_many :recievers, dependent: :destroy
  has_many :recieving_mailboxes, source: :mailbox, through: :recievers

  validate :number_of_emails

  before_save :check_for_spam, :default_subject, :recipient_limit_reached?
  after_save :add_log_entry, :add_contact

  def number_of_emails
    mailboxes = Mailbox.find_by_id(mailbox)
    if mailboxes.emails.size > 10
      errors.add :base, 'max limit reached'
      false
    end
  end

  def default_subject
    unless subject
      self.subject = 'This is default subject'
    end
  end

  def check_for_spam
    # FIXME_AK: Refactor this method. done
    # FIXME_AK: no need for self. done
    attachments.any? {|attachment| attachment.type == 'Audio'} ? self.tag = 'spam' : self.tag = 'normal'
  end

  # FIXME_AK: naming. done
  # FIXME_AK: ditto for above. done
  def add_log_entry
    Log.create(email_id: id)
  end

    def recipient_limit_reached?
    if recieving_mailboxes.size > 20
      errors.add :base, 'max number of reciepients limit reached'
      false
    end
  end

  def add_contact
    if tag == 'normal'
      recieving_mailboxes.each do |mailbox|
        if mailbox.contacts.none? { |contact| contact.mailbox_id == mailbox.id }
          mailbox.contacts
          mailbox.contacts.create()
        end
      end
    end
  end


end
