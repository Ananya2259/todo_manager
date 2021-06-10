class User < ActiveRecord::Base
  validates :email, presence: true
  validates :first_name, presence: true
  has_many :todos
  has_secure_password

  def to_user_details
    " Email:#{email} Password:#{password}"
  end
end
