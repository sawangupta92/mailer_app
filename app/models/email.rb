class Email < ActiveRecord::Base
  # FIXME_AK: Reorder the statements. done
  # FIXME_AK: Clashing of the associations. done
  belongs_to :mailbox, foreign_key: 'sender_mailbox_id'
  # FIXME_AK: do we need to preserve the attachments when email is destroyed? done
  has_many :attachments, dependent: :destroy
  # FIXME_AK: name must be pluralized here. done
  has_and_belongs_to_many :mailboxes

  validate :number_of_emails

  before_save :check_for_spam, :recipient_limit_reached?, :default_subject
  after_save :add_contact, :add_log_entry

  def number_of_emails
    mailboxes = Mailbox.find_by_id(mailbox)
    if mailboxes.emails.size > 10
      errors.add :base, 'max limit reached'
      false
    end
  end

  def default_subject
    if subject.nil?
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
  def recipient_limit_reached?
    if mailboxes.size > 20
      errors.add :base, 'max number of reciepients limit reached'
      false
    end
  end

  def add_log_entry
    Log.create(email_id: id)
  end

  def add_contact
    if tag == 'normal'
      mailboxes.each do |mailbox|
        if mailbox.contacts.none? { |contact| contact.mailbox_id == mailbox.id }
          mailbox.contacts
          mailbox.contacts.create()
        end
      end
    end
  end

end
