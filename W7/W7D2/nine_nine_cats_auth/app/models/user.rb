class User < ApplicationRecord
    validates :password_digest, presence: true
    validates :user_name, :session_token, presence: true, uniqueness: true
    after_initialize :ensure_session_token

    attr_reader :password, :password_c
    
    has_many :cats

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end


    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    def password_c=(password_c)
        @password_c = password_c
    end

    

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.is_password?(password)
            user
        end
    end

    
    private
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
