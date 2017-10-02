module Hangar
  class RecordsController < ActionController::Base
    def delete
      DatabaseCleaner.clean_with Hangar.clean_strategy, except: Hangar.do_not_delete
      head :no_content, content_type: "text/html"
    end
  end
end
