class Project < ActiveRecord::Base
  validates :acc, presence: true
  
  has_many :workships
  has_many :users, through: :workships
end
