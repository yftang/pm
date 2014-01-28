class Workship < ActiveRecord::Base
  belongs_to :user,    class_name: 'User'
  belongs_to :project, class_name: 'Project'
  
  validates :user_id,    presence: true
  validates :project_id, presence: true
end
