class AddThreadToNatter < ActiveRecord::Migration
  def self.up
    add_column :natters, :thread, :string
  end

  def self.down
    remove_column :natters, :thread
  end
end
