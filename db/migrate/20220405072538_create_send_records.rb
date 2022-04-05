class CreateSendRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :send_records do |t|

      t.timestamps
    end
  end
end
