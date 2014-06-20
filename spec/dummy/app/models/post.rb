class Post < ActiveRecord::Base
  attr_accessor :writer

  after_save do
    self.class.connection_pool.with_connection do |connection|
      connection.execute("UPDATE #{self.class.quoted_table_name} SET author = '#{writer}' WHERE id = #{id}")
    end
    reload
  end
end