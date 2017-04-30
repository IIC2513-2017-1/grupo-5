class CreateInvitationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
    end
    add_reference :invitations, :user, foreign_key: true
    add_reference :invitations, :event, foreign_key: true
  end
end
