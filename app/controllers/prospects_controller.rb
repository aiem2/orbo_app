class ProspectsController < InheritedResources::Base
  before_action :set_prospect, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[edit update destroy]

    # GET /partners or /partners.json
    def index
      @busqueda = Prospect.ransack(params[:q])
      @busqueda.sorts = ['date_end desc'] if @busqueda.sorts.empty?
      @benefits = @busqueda.result.page(params[:page])
   
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
      @status =['Inscripción', 'Revisión', 'Contacto','Aceptada', 'Rechazada']

    end

    # GET /partners/1 or /partners/1.json
    def show
    end

    # GET /partners/new
    def new
      @prospect = Prospect.new
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
      @status =['Inscripción', 'Revisión', 'Contacto','Aceptada', 'Rechazada']
    end

    # GET /partners/1/edit
    def edit
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
    end

    # POST /partners or /partners.json
    def create
      @prospect = Prospect.new(prospect_params)
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Los Lagos','Aysén', 'Magallanes', 'Nacional']

      respond_to do |format|
        if @prospect.save
          format.html { redirect_to prospect_url(@prospect), notice: "Tu inscripción fue creada con éxito." }
          format.json { render :show, status: :created, location: @prospect }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @prospect.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /partners/1 or /partners/1.json
    def update
      respond_to do |format|
        if @prospect.update(prospect_params)
          format.html { redirect_to benefit_url(@prospect), notice: "La inscripción fue actualizada con éxito." }
          format.json { render :show, status: :ok, location: @prospect }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @prospect.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /partners/1 or /partners/1.json
    def destroy
      @prospect = Prospect.find(params[:id])
      @prospect.destroy

      respond_to do |format|
        format.html { redirect_to prospects_url, notice: "La inscripción fue eliminada con éxito." }
        format.json { head :no_content }
      end
    end

  private
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    def prospect_params
      params.require(:prospect).permit(:name, :email, :area, :liason_name, :liason_phone, :liason_mail, :logo_url, :web, :fb, :ig, :description, :address, :city, :state, :status)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
