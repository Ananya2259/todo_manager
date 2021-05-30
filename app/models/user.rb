class User < ActiveRecord::Base
  #creates a format to display the user details.
  def to_user_details
    "Name:#{name} Email:#{email} Password:#{password}"
  end
end
