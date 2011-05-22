class AddMutedAtToSchmozzelers < ActiveRecord::Migration
  def self.up
    add_column :schmozzelers, :muted_at, :datetime
  end

  def self.down
    remove_column :schmozzelers, :muted_at
  end
end
