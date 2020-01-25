class User < ApplicationRecord
    before_create 

    has_secure_password

    def remember_token
        @remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
        @user.save
    end

    
end
