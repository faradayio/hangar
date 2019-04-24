module Hangar
  class RecordsController < ActionController::Base
    def delete
      Hangar.created_data.each do |key, value|
        value.constantize.delete(key)
      end
      Hangar.created_data.clear
      render json: {"delete": "success"}.to_json, status: 200
    end
  end
end
