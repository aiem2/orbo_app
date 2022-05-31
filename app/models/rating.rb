class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  paginates_per 15

  def user_name
    id = self.user_id
    @user_name = User.find(id).name
  end
end
