class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,     null: false        
      t.string :email,    null: false, default: ""                        
      t.string :password, null: false, default: ""                               
      t.text   :t_name1,  null: false                           
      t.text   :t_name2,  null: false                          
      t.text   :birth,    null: false                        
      t.timestamps              
    end
  end
end
