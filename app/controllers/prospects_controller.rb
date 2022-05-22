class ProspectsController < InheritedResources::Base

  private

    def prospect_params
      params.require(:prospect).permit(:name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state)
    end

end
