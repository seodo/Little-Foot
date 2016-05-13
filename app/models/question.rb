class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :category
  has_one :response


  validates :content, :survey_id, :category, presence: true
end
