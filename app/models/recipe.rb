# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many   :steps, dependent: :destroy

  accepts_nested_attributes_for :steps, :allow_destroy => true

  validates :title, presence: true

end
