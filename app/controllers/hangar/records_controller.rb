module Hangar
  class RecordsController < ActionController::Base
    respond_to :json

    def delete
      DatabaseCleaner.clean_with :deletion, except: Hangar.do_not_delete
      render nothing: true, status: :no_content
    end
  end
end
