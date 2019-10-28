class Attraction < ApplicationRecord
    belongs_to :user
    belongs_to :state
    
    validates :name, :location, presence: true, :uniqueness => true
    validates :state_id, presence: true 
    validates_associated :state 


    def state_attributes=(attributes)
        state = State.find_or_create_by(attributes)
        self.state = state if state.valid? || !self.state 
    end

    def attraction_plus_state 
        "#{self.name}, #{state.name}"
    end 

    def update_like 
        if self.like == nil
            self.like = 1  
         else 
             self.like += 1
         end 
    end 

    # def self.likes_order
    #     Attraction.all.sort_by { |attraction| [attraction.like] }
    # end 

    scope :likes_order, -> { order('like desc') }
    
end


