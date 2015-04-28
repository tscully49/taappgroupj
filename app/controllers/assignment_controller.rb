class AssignmentController < ApplicationController

    def assigned_tas
        @courses= Course.where(professor_id: session[:id])
         @finalized = Finalized.first
    end
    
    def view_apps
        @courses= Course.where(professor_id: session[:id])
    end 
    
    def show
    end 
end
