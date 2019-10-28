class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    def self.find_or_create_by_omniauth(auth)
      
      User.find_or_create_by(uid: auth["uid"]) do |user|
        user.provider = auth["provider"]
        user.name = auth["info"]["name"] || auth["info"]["nickname"]
        user.email = auth["info"]["email"]
        user.password = SecureRandom.hex(10) 
      end
    end
  end 
