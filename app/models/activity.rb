class Activity < ActiveRecord::Base

  belongs_to :member
  has_many :activity_categories
  has_many :categories, through: :activity_categories
  validates :location, presence: true, length: { minimum: 3, maximum: 30}
  validates :bio, presence: true, length: { minimum: 10, maximum: 140}
  validates :member_id, presence: true
end
