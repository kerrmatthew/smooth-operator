class Project < ActiveRecord::Base
  attr_accessible :due_date, :name, :start_date, :status

  include Progressable


  has_one :owner, class_name: :user
  has_one :progress_item_delegate, as: :progress_item
  
  has_many :tasks
  has_many :members, through: :project_memberships, class_name: :user
  
  accepts_nested_attributes_for :progress_item_delegate

end
