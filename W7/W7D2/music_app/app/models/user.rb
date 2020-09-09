class User < ApplicationRecord
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    before_validation :ensure_session_token # similar idea to 'after_initialize'

    attr_reader :password
    
    # Associations:

    # SPIRE:
    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def self.find_by_credential(email, pw)
        user = User.find_by(email: email)
        return nil unless user
        user.is_password?(pw) ? user : nil
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        save!
        session_token
    end

    def password=(pw)
        self.password_digest = BCrypt::Password.create(pw)
        @password = pw
    end

    def is_password?(pw)
        BCrypt::Passwrod.new(password_digest).is_password?(pw)
    end

    private

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
