class Question < ActiveRecord::Base
  belongs_to :category
  has_many :responses


  validates :content, :category, presence: true
end
