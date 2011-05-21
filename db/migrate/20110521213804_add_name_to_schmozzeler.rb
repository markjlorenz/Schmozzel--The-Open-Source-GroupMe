class AddNameToSchmozzeler < ActiveRecord::Migration
  def self.up
    add_column :schmozzelers, :name, :string
  end

  def self.down
    remove_column :schmozzelers, :name
  end
end
