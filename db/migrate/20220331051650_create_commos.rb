class CreateCommos < ActiveRecord::Migration[6.0]
  def change
    create_table :commos do |t|

      t.string     :commo_name           ,null: false
      t.text       :commo_ex             ,null: false
      t.integer    :commo_cate_id        ,null: false
      t.integer    :commo_st_id          ,null: false
      t.integer    :commo_deli_charge_id ,null: false
      t.integer    :prefecture_id        ,null: false
      t.integer    :commo_deli_day_id    ,null: false
      t.integer    :commo_price          ,null: false
      t.references :user                 ,null: false,foreign_key: true

      t.timestamps
    end
  end
end
