class AssignmentController < ApplicationController

    def assignment
    
    @courses= Course.where(professor_id: session[:id])
    #@assigned=ApplicationCourse.where(:application_id => @application.id, :taught_teach_take_want => "want")
   
    #@appcourse = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "want")
    end
    
    def view_apps
        @courses= Course.where(professor_id: session[:id])
    end 

end
