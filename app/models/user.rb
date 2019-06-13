class User < ActiveRecord::Base
    has_secure_password

    validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
    validates :email, uniqueness: true,  
    validates :password, :password_confirmation, length: { minimum: 4 }
end


