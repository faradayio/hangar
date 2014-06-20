class RenameLowercasedTitleToAuthor < ActiveRecord::Migration
  rename_column :posts, :lowercased_title, :author
end
