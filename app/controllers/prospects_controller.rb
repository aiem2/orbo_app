class ProspectsController < InheritedResources::Base
  before_action :must_be_admin, only: %i[new create edit update destroy]

  private

    def prospect_params
      params.require(:prospect).permit(:name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
