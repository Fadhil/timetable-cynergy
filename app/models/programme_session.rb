class ProgrammeSession < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :active, -> { where(active: true) }

  has_many :registrations
  has_many :users, through: :registrations
  has_and_belongs_to_many :modules, class_name: 'ProgrammeModule'
end
