class Project < ActiveRecord::Base
  attr_accessible :due_date, :name, :start_date, :status

  has_one :owner, class_name: :user
  has_one :progress_item_delegate
  
  has_many :tasks
  has_many :members, through: :project_memberships, class_name: :user
  

end