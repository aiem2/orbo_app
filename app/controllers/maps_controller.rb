class MapsController < InheritedResources::Base

  private

    def map_params
      params.require(:map).permit(:name, :lat, :long)
    end

end
