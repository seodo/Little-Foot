class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey

  validates :content, :question_id, presence: true
end
