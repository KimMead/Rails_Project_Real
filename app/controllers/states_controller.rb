class StatesController < ApplicationController
    
    def index
        @states = State.all 
    end 

    def show
        @state = State.find_by(id: params[:id])
    end 

    def most_comments 
        @state = State.most_comments 
    end 

    private 

    def state_params 
        params.require(:state).permit(:name)
    end 
end 