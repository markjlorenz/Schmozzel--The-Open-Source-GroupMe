class Schmozzeler < ActiveRecord::Base
  has_many :natters
  
  scope :muted, where('muted_at IS NOT NULL')
  scope :listening, where('muted_at IS NULL')

  def self.in_thread thread
    joins(:natter).where('natters.thread == ?', thread)
  end
  def rename new_name
    update_attribute :name, new_name
  end
end
