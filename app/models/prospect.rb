class Prospect < ApplicationRecord
    paginates_per 15
    has_one :logo_url

    validates :name, presence: true
    validates :email, presence: true
    validates :area, presence: true
    validates :logo_url, presence: true
    validates :description, presence: true
    validates :state, presence: true
    validates :liason_name, presence: true
    validates :liason_mail, presence: true
    validates :liason_mail, email: true

    validates :email, email: true
    validates :logo_url, format: URI::regexp(%w[http https])
  
    
end
