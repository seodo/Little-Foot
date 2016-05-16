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

  def worst_response_carbon_offender
    worst_response = self.responses.max_by { |response| ImpactItem.find_by(id: response.impact_item_id).carbon * response.quantity}


    # worst_response_impact_item = ImpactItem.find_by(id: worst_response.impact_item_id)
    # worst_response.quantity * worst_response_impact_item.carbon

  end

  def worst_question_carbon_offender
    Question.find_by(id: worst_response_carbon_offender.question_id)
  end

  def worst_impact_item_carbon_offender
    ImpactItem.find_by(id: worst_response_carbon_offender.impact_item_id)
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
