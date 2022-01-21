class PhonesController < ApplicationController
    
    def create
        @contact = Contact.find(params[:contact_id])
        @phone = @contact.phones.create(phone_params)
        redirect_to contact_path(@contact)
    end
    
    def destroy
        @contact = Contact.find(params[:contact_id])
        @phone = @contact.phones.find(params[:id])
        @phone.destroy
        redirect_to contact_path(@contact), status: 303
    end

    private
        def phone_params
            params.require(:phone).permit(:phone_type, :number)
        end
end
