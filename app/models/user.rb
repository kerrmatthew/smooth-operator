class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :projects, through: :project_memberships
  has_many :owned_projects, class_name: :project, inverse_of: :owner
  has_many :tasks, group: :project_id, inverse_of: :assignee
  has_many :tasks_assigned_by, class_name: :task, inverse_of: :assigner

end
