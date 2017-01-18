class ProgrammeSession < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :active, -> { where(active: true) }

  has_many :registrations
  has_many :users, through: :registrations
  has_and_belongs_to_many :modules, class_name: 'ProgrammeModule'

  def trainers_by_modules
    unless registrations.empty?
      trainers_modules = {}
      modules.each do |pm|
        trainers_modules[pm.code] = {name: pm.name, trainer_count: 0, trainers: []} unless trainers_modules[pm.code]
      end
      registrations.map{|r| [r.user.email, r.programme_modules.map{|m| [m.name, m.code]}]}.each do |email, pmodules|
        pmodules.each do |name, code|
          trainers_modules[code][:trainer_count] = trainers_modules[code][:trainer_count] + 1
          trainers_modules[code][:trainers] << email unless trainers_modules[code][:trainers].include?(email)
        end
      end
      trainers_modules.sort
    end
  end
end
