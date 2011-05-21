class Schmozzeler < ActiveRecord::Base
  has_many :natters
  def rename new_name
    update_attribute :name, new_name
  end
end
