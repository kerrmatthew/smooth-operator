class Task < ActiveRecord::Base
  attr_accessible :due_date, :name, :start_date, :status

  belongs_to :project
  belongs_to :assignee, class_name: :user
  belongs_to :assigner, class_name: :user


end
