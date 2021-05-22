class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string     :pos_code,  null: false
      t.integer    :area_id,   null: false
      t.string     :city,      null: false
      t.string     :address,   null: false
      t.string     :building  
      t.string     :phone_num, null: false
      t.references :record,foreign_key:true,null: false
      t.timestamps
    end
  end
end
