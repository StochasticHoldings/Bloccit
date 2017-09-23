class SponsoredPost < ActiveRecord::Base
  belongs_to :topic
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true

end
