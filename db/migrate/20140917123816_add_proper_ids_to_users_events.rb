class AddProperIdsToUsersEvents < ActiveRecord::Migration
  def change
    add_column :users_events, :attendee_id, :integer
    add_column :users_events, :attended_event_id, :integer
  end
end
