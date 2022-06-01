class Partner < ApplicationRecord
    has_many :ratings
    has_one :logo_url
    
    paginates_per 15
    validates :name, presence: true
    validates :email, presence: true
    validates :email, email: true
    validates :area, presence: true
    validates :logo_url, presence: true
    validates :logo_url, format: URI::regexp(%w[http https])
    validates :description, presence: true
    validates :state, presence: true
    validates :liason_name, presence: true
    validates :liason_mail, presence: true
    validates :liason_mail, email: true
  
end
