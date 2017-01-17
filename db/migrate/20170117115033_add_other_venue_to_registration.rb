class AddOtherVenueToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :other_venue, :string
  end
end
