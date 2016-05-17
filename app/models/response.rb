class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  belongs_to :impact_item
  belongs_to :multiplier

  validates :question_id, presence: true

end
