class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  has_one :impact_item

  validates :question_id, presence: true
end
