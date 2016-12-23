class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where( :status => "completed" ) }
  scope :within_days, ->(x) { where("created_at > ?", x.days) }
end