class Order < ActiveRecord::Base
  belongs_to :tour

  validate :email_validation, :phone_validation
  validates_presence_of :email, :title, :phone

  private

  def email_validation
    errors.add(:email, "введен некорректно") unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def phone_validation
    errors.add(:phone, "введен некорректно") unless self.phone =~ /[+]\d+/
  end
end
