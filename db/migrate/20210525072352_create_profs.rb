class CreateProfs < ActiveRecord::Migration[6.0]
  def change
    create_table :profs do |t|
      t.string     :hobby,                 null:false
      t.text       :comment,               null:false
      t.references :user,foreign_key:true, null:false
      t.timestamps
    end
  end
end
