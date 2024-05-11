class ChangeBookingIdToNullableInChats < ActiveRecord::Migration[7.1]
  def change
    change_column :chats, :booking_id, :bigint, null: true
  end
end
