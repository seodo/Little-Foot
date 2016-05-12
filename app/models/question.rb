class Question < ActiveRecord::Base
  belongs_to :survey
  has_one :response

  validates :content, :survey_id, :category, presence: true
end
