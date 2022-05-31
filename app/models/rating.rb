class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  
  paginates_per 15
  validates :user_id, presence: true
  validates :partner_id, presence: true
  validates :date_service, presence: true
  validates :type_service, presence: true
  validates :description, presence: true
  validates :rate, presence: true
  def user_name
    id = self.user_id
    @user_name = User.find(id).name
  end
end
