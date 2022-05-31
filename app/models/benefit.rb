class Benefit < ApplicationRecord
  belongs_to :partner
  paginates_per 15

  def partner_name
    id = self.partner_id
    @partner_name = Partner.find(id).name
  end
end
