class Post < ActiveRecord::Base
  after_save do
    self.class.connection_pool.with_connection do |connection|
      connection.execute("UPDATE #{self.class.quoted_table_name} SET lowercased_title = LOWER(title) WHERE id = #{id}")
    end
    reload
  end
end