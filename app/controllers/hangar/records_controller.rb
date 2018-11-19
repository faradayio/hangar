module Hangar
  class RecordsController < ActionController::Base
    def delete
      Hangar.created_data.each do |key, value|
        value.constantize.delete(key)
      end
      head :no_content, content_type: "text/html"
    end
  end
end
