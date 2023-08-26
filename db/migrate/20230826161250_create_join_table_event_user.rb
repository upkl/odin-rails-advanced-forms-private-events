class CreateJoinTableEventUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :attended_events, :attendees, table_name: :event_attendances do |t|
      t.index %i[attended_event_id attendee_id]
      # t.index %[attendee_id attended_event_id]
      t.primary_key :id
    end

    add_foreign_key :event_attendances, :users, column: :attendee_id
    add_foreign_key :event_attendances, :events, column: :attended_event_id
  end
end
