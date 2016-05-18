class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys

  validates :full_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: 'email must be in the format of: myname@email.com'

  # def get_timeline(surveys)
  #   # returns in minutes, will change to days for final.
  #   surveys.each_cons(2).map { |a, b| ((b.created_at - a.created_at)/60).round(2) }
  # end

  def average_carbon_footprint
    sum_footprint = 0
    if self.surveys.any?
      self.surveys.each do |survey|
        sum_footprint += survey.calculate_footprint
      end
        return footprint_average = (sum_footprint/self.surveys.count).round(2)
    else
      return 0
    end
  end

  def top_ten_users(users)
    users.sort_by { |user| user.average_carbon_footprint }[0...10]
  end
end
