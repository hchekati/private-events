class RemoveColumnFromEvents < ActiveRecord::Migration
  def change
    remove_reference :events, :user, index: true
  end
end
