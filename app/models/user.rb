class User < ApplicationRecord
    has_secure_password
    has_many :items, dependent: :destroy
    has_many :outfits, dependent: :destroy

    validates :first_name, :last_name, presence: { message: 'must be present!' }
    # VALID_EMAIL_REGEX = /\A([\w+\-.]\ ?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates(
        :email,
        presence: true,
        uniqueness: true,
        # format: VALID_EMAIL_REGEX
      )

    def full_name
        first_name + " " + last_name
    end

    def self.new_guest
        new(email: "#{Time.now}@bogus.com", 
            first_name: 'Guest',
            last_name: 'Guest',
            password_digest: 'bogus')
    end
    
    def guest?
        email.include?('bogus.com')
    end
end
