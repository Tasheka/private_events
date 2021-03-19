class CreateInvitation < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :event_id
      t.string :attendee_id

      t.timestamps
    end
  end
end
