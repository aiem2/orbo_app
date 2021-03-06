class PartnersController < InheritedResources::Base
  before_action :set_partner, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new create edit update destroy]

  # GET /partners or /partners.json
  def index
    @busqueda = Partner.ransack(params[:q])
    @busqueda.sorts = ['id asc', 'created_at desc'] if @busqueda.sorts.empty?
    @partners = @busqueda.result.page(params[:page])
 
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
    @partners_total = Partner.all.count
  end

  # GET /partners/1 or /partners/1.json
  def show
    @ratings = Rating.where(:partner_id => @partner)
    user_name = @user_name
    @rates = Rating.where(:partner_id => @partner).count
    @average = @ratings.average(:rate)
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
  end

  # GET /partners/1/edit
  def edit
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
  end

  # POST /partners or /partners.json
  def create
    @partner = Partner.new(partner_params)
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Los Lagos','Aysén', 'Magallanes', 'Nacional']

    respond_to do |format|
      if @partner.save
        format.html { redirect_to partner_url(@partner), notice: "El Partner fue creado con éxito." }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to partner_url(@partner), notice: "El Partner fue actualizado con éxito." }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_url, notice: "Partner fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state, :phone, :logo)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
