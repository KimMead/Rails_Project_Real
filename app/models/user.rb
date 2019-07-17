class User < ApplicationRecord
    has_many :attractions
    has_many :states, through: :attractions 
    has_many :comments
    has_many :commented_states, through: :comments, source: :state  
    
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true 
    has_secure_password 

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end
  
    # def self.create_with_omniauth(auth)
    #   self.where(:email => auth["info"]["email"]).first_or_create do |user|
    #     user.password = SecureRandom.hex 
    #   end
    # end
    
  # def self.find_or_create_by_omniauth(auth)
  #   self.where(:email => auth["info"]["email"], :name => auth["info"]["name"]).first_or_create do |user|
  #     user.password = SecureRandom.hex 
  #   end
  # end

 
  #   def self.create_with_omniauth(auth)
  #     create! do |user|
  #       user.provider = auth["provider"]
  #       user.uid = auth["uid"]
  #       user.name = auth["info"]["name"]
  #     end
  #   end
  end
