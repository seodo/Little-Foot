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
    footprint
  end

  def calculate_footprint_by_category(category)
    footprint = 0
    category_responses = self.responses.select { |response| Category.find_by(id: response.question.category_id).title.downcase == category.downcase}

    category_responses.each do |response|
       item = ImpactItem.find_by(id: response.impact_item_id)
       footprint += response.quantity * item.carbon
     end
     footprint
  end

end
