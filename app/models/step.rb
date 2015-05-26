class Step < ActiveRecord::Base
  belongs_to :recipe
  validates :title, presence: true
end
