class ContentsController < InheritedResources::Base

  private

    def content_params
      params.require(:content).permit(:title, :date, :description, :download, :city, :state)
    end

end
