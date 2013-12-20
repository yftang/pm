class Project < ActiveRecord::Base
  before_save :default_values

  validates :acc, presence: true, uniqueness: { case_sensitive: false }
  validates :start_date, presence: true
  validates :status_samples_received,    presence: true,
                                         inclusion: { in: %w(done not-done) }
  validates :status_experiments_done,    presence: true,
                                         inclusion: { in: %w(done not-done) }
  validates :status_bioinformatics_done, presence: true,
                                         inclusion: { in: %w(done not-done) }
  validates :status_report_finished,     presence: true,
                                         inclusion: { in: %w(done not-done) }
  validates :status, presence: true, inclusion: { in: %w(running complete) }

  has_many :workships
  has_many :users, through: :workships

  private
    def default_values
      self.status_samples_received    ||= 'not-done'
      self.status_experiments_done    ||= 'not-done'
      self.status_bioinformatics_done ||= 'not-done'
      self.status_report_finished     ||= 'not-done'
    end
end
