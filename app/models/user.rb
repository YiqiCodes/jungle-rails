class User < ActiveRecord::Base
  
  def self.authenticate_with_credentials (email, password)
    filteredEmail = email.downcase.strip
    user = User.find_by_email(filteredEmail) 
      if user && user.authenticate(password)
        user
      else
        nil
    end
  end

  validates :email, uniqueness: true
  has_secure_password
end
