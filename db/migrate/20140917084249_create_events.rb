class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.belongs_to :user

      t.timestamps
    end
  end
end
