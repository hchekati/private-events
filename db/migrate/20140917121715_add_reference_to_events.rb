class AddReferenceToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :attendee, index: true
  end
end
