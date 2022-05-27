class BenefitsController < InheritedResources::Base
  before_action :set_benefit, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new create edit update destroy]

    # GET /partners or /partners.json
    def index
      @busqueda = Benefit.ransack(params[:q])
      @busqueda.sorts = ['id asc', 'created_at desc'] if @busqueda.sorts.empty?
      @benefits = @busqueda.result.page(params[:page])
   
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes']

    end

    # GET /partners/1 or /partners/1.json
    def show
    end

    # GET /partners/new
    def new
      @benefit = Benefit.new
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes']
    end

    # GET /partners/1/edit
    def edit
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes']
    end

    # POST /partners or /partners.json
    def create
      @benefit = Benefit.new(benefits_params)
      @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
      @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Los Lagos','Aysén', 'Magallanes']

      respond_to do |format|
        if @benefit.save
          format.html { redirect_to benefit_url(@benefit), notice: "El beneficio fue creado con éxito." }
          format.json { render :show, status: :created, location: @benefit }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @benefit.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /partners/1 or /partners/1.json
    def update
      respond_to do |format|
        if @benefit.update(benefits_params)
          format.html { redirect_to benefit_url(@benefit), notice: "El Beneficio fue actualizado con éxito." }
          format.json { render :show, status: :ok, location: @benefit }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @benefit.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /partners/1 or /partners/1.json
    def destroy
      @benefit = Benefit.find(params[:id])
      @benefit.destroy

      respond_to do |format|
        format.html { redirect_to benefits_url, notice: "El beneficio fue eliminado con éxito." }
        format.json { head :no_content }
      end
    end

  private
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    def benefit_params
      params.require(:benefit).permit(:date_start, :date_end, :city, :state, :description, :partner_id, :area)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
