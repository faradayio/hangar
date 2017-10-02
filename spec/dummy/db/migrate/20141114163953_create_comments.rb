class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :post
    end
  end
end
