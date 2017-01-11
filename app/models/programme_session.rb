class ProgrammeSession < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :active, -> { where(active: true) }
end
