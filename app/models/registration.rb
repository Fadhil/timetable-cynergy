class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :programme_session
  belongs_to :venue
  has_and_belongs_to_many :programme_modules

  serialize :timetable

  def venue_name
    if venue
      venue.name
    else
      other_venue
    end
  end
end
