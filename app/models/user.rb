class User < ActiveRecord::Base
  def to_user_details
    "Name:#{name} Email:#{email} Password:#{password}"
  end
end
