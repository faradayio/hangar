require 'spec_helper'

describe Hangar::RecordsController do
  describe '#delete' do
    before do
      FactoryGirl.create :post
      FactoryGirl.create :very_important_thing
    end

    it 'deletes all records' do
      expect { delete :delete, format: :json }.to change(Post, :count).by(-1)
    end

    it 'does not delete important things' do
      Hangar.clean_strategy = :deletion
      Hangar.do_not_delete = 'very_important_things'
      expect { delete :delete, format: :json }.not_to change(VeryImportantThing, :count)
    end

    it 'truncates the records' do
      Hangar.clean_strategy = :truncation
      expect { delete :delete, format: :json }.to change(Post, :count).by(-1)
    end

    it 'does not truncate important things' do
      Hangar.clean_strategy = :truncation
      Hangar.do_not_delete = 'very_important_things'
      expect { delete :delete, format: :json }.not_to change(VeryImportantThing, :count)
    end

    it 'errors when given an invalid strategy' do
      Hangar.clean_strategy = :invalid_strategy
      expect { delete :delete, format: :json }.to raise_error(DatabaseCleaner::UnknownStrategySpecified)
      Hangar.clean_strategy = :deletion
    end
  end
end
