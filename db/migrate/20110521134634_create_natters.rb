class CreateNatters < ActiveRecord::Migration
  def self.up
    create_table :natters do |t|
      t.string :from
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :natters
  end
end
