class Project < ActiveRecord::Base
  attr_accessible :due_date, :name, :owner_id, :start_date, :status

  has_many :members, through: :project_memberships, class_name: :user
  has_one :owner, class_name: :user
  has_many :tasks

end
