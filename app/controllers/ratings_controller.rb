class RatingsController < InheritedResources::Base
  before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[index show edit update destroy]

    # GET /partners or /partners.json
    def index
      @busqueda = Rating.ransack(params[:q])
      @busqueda.sorts = ['id desc'] if @busqueda.sorts.empty?
      @ratings = @busqueda.result.page(params[:page])
    end

    # GET /partners/1 or /partners/1.json
    def show
    end

    # GET /partners/new
    def new
      @rating = Rating.new
      
    end

    # GET /partners/1/edit
    def edit
    end

    # POST /partners or /partners.json
    def create
      @rating = Rating.new(rating_params)
      @user_id = current_user.id
      @partner_id = Partner.first
      respond_to do |format|
        if @rating.save
          format.html { redirect_to root_path, notice: "Tu evaluación fue creada con éxito." }
          format.json { render :show, status: :created, location: @rating }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /partners/1 or /partners/1.json
    def update
      respond_to do |format|
        if @rating.update(rating_params)
          format.html { redirect_to rating_url(@rating), notice: "La evaluación fue actualizada con éxito." }
          format.json { render :show, status: :ok, location: @rating }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /partners/1 or /partners/1.json
    def destroy
      @rating = Rating.find(params[:id])
      @rating.destroy

      respond_to do |format|
        format.html { redirect_to ratings_url, notice: "La evaluación fue eliminada con éxito." }
        format.json { head :no_content }
      end
    end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:date_service, :type_service, :description, :user_id, :partner_id, :rate)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path, notice: "No puede acceder a esta sección"
      end
    end

end
