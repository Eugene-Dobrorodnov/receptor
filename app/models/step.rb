# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  title       :string
#  description :text
#  point       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ActiveRecord::Base
  belongs_to :recipe
  validates :title, presence: true
end
