class CreateSendRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :send_records do |t|

      t.string    :post_code       ,null: false
      t.integer   :prefecture_id   ,null: false
      t.string    :municipality    ,null: false
      t.string    :cities          ,null: false
      t.string    :building        ,null: false
      t.string    :tell_num        ,null: false
      t.references :order          ,null: false,foreign_key: true

      t.timestamps
    end
  end
end