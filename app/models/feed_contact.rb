class FeedContact < ActiveRecord::Base
  belongs_to :feed

  validate :format_validation
  validates_presence_of :text, :contact_type

  scope :email_feeds, -> { where(:contact_type => "email") }
  scope :sms_feeds, -> { where(:contact_type => "phone") }

  private

  def format_validation
    if self.contact_type == "email"
      errors.add(:text, "невалидный email") unless self.text =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    else
      errors.add(:text, "невалидный телефонный номер") unless self.text =~ /[+]\d+/
    end
  end
end
