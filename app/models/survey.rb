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

  def calculate_footprint_by_category(category)

    category_responses = self.responses.select { |response| Category.find_by(id: response.question.category_id).title.downcase == category.downcase }

    footprint = category_responses.reduce(0) { |footprint, response| footprint + response.quantity * response.impact_item.carbon }

     footprint.round(2)
  end

end
