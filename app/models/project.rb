class Project < ActiveRecord::Base
  validates :acc, presence: true, uniqueness: { case_sensitive: false }
  validates :start_date, presence: true
  validates :status, presence: true,
                     inclusion: { in: %w(running complete),
                                  message: "%{value} is not valid" }

  has_many :workships
  has_many :users, through: :workships
end
