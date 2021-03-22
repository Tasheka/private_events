class AddEmailToInvitation < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :email, :string
  end
end
