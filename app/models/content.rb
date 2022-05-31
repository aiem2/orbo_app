class Content < ApplicationRecord
    paginates_per 15
    validates :area, presence: true
    validates :logo_url, presence: true
    validates :title, presence: true
    validates :date, presence: true
    validates :download, presence: true
    validates :state, presence: true
end
