class BenefitsController < InheritedResources::Base
  before_action :must_be_admin, only: %i[new create edit update destroy]

  private

    def benefit_params
      params.require(:benefit).permit(:date_start, :date_end, :city, :state, :description, :partner_id)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
