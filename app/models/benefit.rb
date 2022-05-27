class Benefit < ApplicationRecord
  belongs_to :partner

  def partner_name
    id = self.partner_id
    @partner_name = Partner.find(id).name
  end
end
