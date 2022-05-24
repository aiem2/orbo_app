class RatingsController < InheritedResources::Base
  before_action :must_be_admin, only: %i[new create edit update destroy]

  private

    def rating_params
      params.require(:rating).permit(:date_service, :type_service, :description, :user_id, :partner_id)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
