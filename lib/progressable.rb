module Progressable  
  
  def self.included(base)
    base.attr_accessible :progress_item_delegate_attributes
  
    base.has_one :progress_item_delegate, as: :progress_item
    base.after_create :create_progress_item_delegate
  
    base.accepts_nested_attributes_for :progress_item_delegate
    
    base.delegate :status, to: :progress_item_delegate, allow_nil: true
  end
  
end