class CreateVeryImportantThings < ActiveRecord::Migration[4.2]
  def change
    create_table :very_important_things do |t|
      t.text :name
    end
  end
end
