class UsersController < ApplicationController
    before_action :must_be_admin, only: %i[new index show create edit update destroy]
  
    # GET /partners or /partners.json
    def index
      @busqueda = User.ransack(params[:q])
      @busqueda.sorts = ['id asc'] if @busqueda.sorts.empty?
      @users = @busqueda.result.page(params[:page])
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
      @users_total = User.all.count
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
 
      def user_params
        params.require(:user).permit(:email, :name, :nick_name, :phone, :city, :state, :dob, :gender, :admin)
      end
  
      def must_be_admin
        unless current_user && current_user.admin?
          redirect_to root_path, notice: "No puede acceder a esta sección"
        end
      end
  
end
  

