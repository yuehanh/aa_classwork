require 'rails_helper'

RSpec.describe User, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"

    # What to test?
    #   Validations
    #   Associations
    #   Class Methods
    #   Error Messages
    subject(:user) { FactoryBot.build(:user) }
    describe 'validations' do
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_presence_of(:session_token) }
        it { should validate_uniqueness_of(:session_token) }
        it { should validate_uniqueness_of(:username) }
        it { should validate_length_of(:password).is_at_least(6) }
        it 'creates a password_digest when a password is given' do
            expect(user.password_digest).to_not be_nil
        end
        it 'does not store a password in the database' do
            FactoryBot.create(:user, username: 'happy')
            user = User.find_by(username: 'happy')
            expect(user.password).to be_nil
        end

        it 'creates a session token before validations' do
            user.valid?
            expect(user.session_token).to_not be_nil
        end
    end

    describe 'passwird encryption' do
        it 'encrypts password using BCrypt' do
            expect(BCrypt::Password).to receive(:create).with('123456')
            FactoryBot.build(:user, password: '123456')
        end
    end
end
