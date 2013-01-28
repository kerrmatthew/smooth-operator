class ProgressItemDelegate < ActiveRecord::Base
  attr_accessible :active, :status
  
  belongs_to :progress_item,  polymorphic: true, touch: true
  
end
