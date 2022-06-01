class Benefit < ApplicationRecord
  belongs_to :partner
  paginates_per 15
  validates :area, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :state, presence: true
  validates :description, presence: true
  

  def partner_name
    id = self.partner_id
    @partner_name = Partner.find(id).name
  end

  def partner_logo
    id = self.partner_id
    @partner_name = Partner.find(id).logo_url
  end
end
