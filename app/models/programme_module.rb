class ProgrammeModule < ActiveRecord::Base
  has_and_belongs_to_many :sessions, class_name: 'ProgrammeSession'
  belongs_to :category
  has_and_belongs_to_many :registrations
end
