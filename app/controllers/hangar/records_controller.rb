module Hangar
  class RecordsController < ActionController::Base
    respond_to :json

    def delete
      DatabaseCleaner.clean_with(:deletion, except: %w{ spatial_ref_sys })
      render nothing: true, status: :no_content
    end
  end
end
