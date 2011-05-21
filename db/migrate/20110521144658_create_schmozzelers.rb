class CreateSchmozzelers < ActiveRecord::Migration
  def self.up
    create_table :schmozzelers do |t|
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :schmozzelers
  end
end
