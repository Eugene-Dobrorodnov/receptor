class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe
      t.string     :title
      t.text       :description
      t.integer    :point
      t.timestamps null: false
    end
  end
end
