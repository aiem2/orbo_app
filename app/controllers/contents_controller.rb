class ContentsController < InheritedResources::Base
  before_action :must_be_admin, only: %i[new create edit update destroy]

  private

    def content_params
      params.require(:content).permit(:title, :date, :description, :download, :city, :state)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end
end
