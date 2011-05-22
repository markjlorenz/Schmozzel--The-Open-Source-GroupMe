class Schmozzeler < ActiveRecord::Base
  has_many :natters
  
  scope :muted, where('muted_at IS NOT NULL')
  scope :listening, where('muted_at IS NULL')

  def rename new_name
    update_attribute :name, new_name
  end
end
