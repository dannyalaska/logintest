class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :permission
      t.cidr :cidr_address
      t.inet :ip_address
      t.int :id
      t.timestamps null: false
    end
  end
end
