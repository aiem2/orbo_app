class BenefitsController < InheritedResources::Base

  private

    def benefit_params
      params.require(:benefit).permit(:date_start, :date_end, :city, :state, :description, :partner_id)
    end

end
