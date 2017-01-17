class AddVenueRefToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :venue, index: true, foreign_key: true
  end
end
