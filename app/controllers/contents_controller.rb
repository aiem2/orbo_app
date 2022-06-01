class ContentsController < InheritedResources::Base
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new create edit update destroy]

  # GET /partners or /partners.json
  def index
    @busqueda = Content.ransack(params[:q])
    @busqueda.sorts = ['id asc', 'created_at desc'] if @busqueda.sorts.empty?
    @contents = @busqueda.result.page(params[:page])
 
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Aysén', 'Magallanes', 'Nacional']
    @contents_total = Content.all.count
  end

  # GET /partners/1 or /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @content = Content.new
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
    @content = Content.new(content_params)
    @areas = ['Turismo', 'Gastronomía', 'Vinos', 'Arte', 'Entretenimiento']
    @regiones = ['Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo', 'Valparaíso', 'Metropolitana', "O'Higgins", 'Maule', 'Ñuble', 'Biobío', 'Araucanía', 'Los Ríos','Los Lagos','Aysén', 'Magallanes', 'Nacional']

    respond_to do |format|
      if @content.save
        format.html { redirect_to content_url(@content), notice: "El contenido fue creado con éxito." }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to content_url(@content), notice: "El beneficio fue actualizado con éxito." }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "El contentido fue eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :date, :description, :download, :city, :state, :logo_url, :area, :logo)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end
end
