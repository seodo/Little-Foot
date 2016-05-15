class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys

  validates :full_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create



  def average_carbon_footprint
    sum_footprint = 0
    self.surveys.each do |survey|
      sum_footprint += survey.calculate_footprint
    end
    footprint_average = sum_footprint/self.surveys.count
  end


end
