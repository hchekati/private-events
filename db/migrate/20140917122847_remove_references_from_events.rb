class RemoveReferencesFromEvents < ActiveRecord::Migration
  def change
    remove_reference :events, :attendee
  end
end
