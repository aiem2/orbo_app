class RatingsController < InheritedResources::Base

  private

    def rating_params
      params.require(:rating).permit(:date_service, :type_service, :description, :user_id, :partner_id)
    end

end
