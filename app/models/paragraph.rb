class Paragraph < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :document
  has_many :comments
end