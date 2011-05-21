class AddSchmozzelerIdToNatter < ActiveRecord::Migration
  def self.up
    add_column :natters, :schmozzeler_id, :integer
  end

  def self.down
    remove_column :natters, :schmozzeler_id
  end
end
