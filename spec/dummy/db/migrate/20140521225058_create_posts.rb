class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
    end
  end
end
