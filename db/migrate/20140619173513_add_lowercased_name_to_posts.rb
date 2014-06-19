class AddLowercasedNameToPosts < ActiveRecord::Migration
  change_table :posts do |t|
    t.text :lowercased_title
  end
end
