class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  validates :email, email: true
  validates :logo_url, format: URI::regexp(%w[http https])
end
