class Contact < ActiveRecord::Base
  # FIXME_AK: no need for single quotes. done
  belongs_to :mailbox

  before_save :default_nickname

  def default_nickname
    if first_name.nil?
      first_name = mailbox.first_name
    end
    if last_name.nil?
      last_name = mailbox.last_name
    end
  end

end
