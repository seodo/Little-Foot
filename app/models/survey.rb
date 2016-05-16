class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :responses


  def calculate_footprint
    footprint = self.responses.reduce(0) { |footprint, response| footprint + (response.quantity * response.impact_item.carbon) }

    footprint.round(2)
  end

  def worst_response_carbon_offender
    worst_response = self.responses.max_by { |response| response.impact_item.carbon * response.quantity}
  end

  def worst_question_carbon_offender
    Question.find_by(id: worst_response_carbon_offender.question_id)
  end

  def worst_impact_item_carbon_offender
    ImpactItem.find_by(id: worst_response_carbon_offender.impact_item_id)
  end

  def calculate_footprint_by_category(category)
    # footprint = 0
    category_responses = self.responses.select { |response| Category.find_by(id: response.question.category_id).title.downcase == category.downcase }

    footprint = category_responses.reduce(0) { |footprint, response| footprint + response.quantity * response.impact_item.carbon }

    # category_responses.each do |response|
    #    footprint +=
    #  end
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
