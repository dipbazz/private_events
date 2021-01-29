class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.references :attendee, foreign_key: {to_table: :users} 
      t.references :attended_event, foreign_key: {to_table: :events}
      t.timestamps
    end
  end
end
