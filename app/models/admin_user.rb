class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  after_destroy :ensure_an_admin_remains


  private

  def ensure_an_admin_remains
    if AdminUser.count.zero?
      raise "Последний пользователь не может быть удален!"
    end
  end

end
