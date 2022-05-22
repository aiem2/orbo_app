class PartnersController < InheritedResources::Base

  private

    def partner_params
      params.require(:partner).permit(:name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state)
    end

end
