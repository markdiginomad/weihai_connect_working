class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        @contact.request = request
        if @contact.deliver
            flash[:success] = "Message sent successfully."
            redirect_to root_path
        else 
            flash[:danger] = "Mesage has not been sent."
            redirect_to new_contact_path
        end
    end
    
    private 
    def contact_params
       params.require(:contact).permit(:name, :email, :comments) 
    end
end 
