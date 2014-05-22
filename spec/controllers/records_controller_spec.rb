require 'spec_helper'

describe Hangar::RecordsController do
  describe '#delete' do
    before do
      FactoryGirl.create :post
    end

    it 'deletes all records' do
      expect { delete :delete, format: :json }.to change(Post, :count).by(-1)
    end
  end
end