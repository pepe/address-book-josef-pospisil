class ApplicationController < ActionController::Base
    def check_session
        if !session[:user_id]
            redirect_to "/login", notice: "you need to be logged in"
        end
    end

    def set_person
        id = params[:id] || params[:person_id]
        
        unless Person.exists?(id)
            redirect_to "/", notice: "person does not exist"
        else
            @person = Person.find(id)
            if @person.user != helpers.current_user
                redirect_to "/logout", notice: "ilegal access"
            end
        end
    end
  
end
