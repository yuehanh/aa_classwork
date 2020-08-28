# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :text             not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, uniqueness: true, presence: true
    validates :user_id, presence: true

    
    def self.random_code
        code = SecureRandom::urlsafe_base64
        while ShortenedUrl.exists?(:short_url => code)
            code = SecureRandom::urlsafe_base64
        end
        code
    end

    def self.generate(user, long_url)
        url_code = ShortenedUrl.random_code
        ShortenedUrl.create(long_url: long_url, short_url: url_code, user_id: user.id)
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
        
    has_many :visits,
        primar_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit

    has_many :visitors,
        Proc.new { distinct },
        through: :visits,
        source: :visitors


    def submitted_urls
        p long_url
        nil
    end
    # how do we protect this

    def num_clicks
        self.visits.length
    end

    def num_uniques
        self.visitors.length
    end

    def num_recent_uniques
    
    end
    
end
