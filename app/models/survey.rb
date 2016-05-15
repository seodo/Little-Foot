class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :responses


  def calculate_footprint
    footprint = 0
    self.responses.each do |response|
      #get item associated with response eg milk, steak.
      item = ImpactItem.find_by(id: response.impact_item_id)
      #get footprint for specific response
      footprint += response.quantity * item.carbon
    end
    footprint.round(2)
  end

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def calculate_footprint_by_category(category)
    footprint = 0
    category_responses = self.responses.select { |response| Category.find_by(id: response.question.category_id).title.downcase == category.downcase }

    category_responses.each do |response|
       item = ImpactItem.find_by(id: response.impact_item_id)
       footprint += response.quantity * item.carbon
     end
     footprint.round(2)
  end

  # def average_carbon_footprint(user)
  #   sum_footprint = 0
  #   user.surveys.each do |survey|
  #     sum_footprint += survey.calculate_footprint
  #   end
  #   footprint_average = sum_footprint/user.surveys.count
  # end

  # def valid_survey_input?(key, value)
    #value coming back is a number string i.e. "1" but we need
    #check that it is a number and not "jdflkskl;adsjf" but
    #converting to number .to_i goes to 0 which is a number..

  #   if value.is_a? Numeric
  #     return true
  #   else
  #     return false
  #     binding.pry
  #   end
  # end


end
