require 'spec_helper'

describe Hangar::ResourcesController do
  describe '#create' do

    before do
      request.path = '/posts'
    end

    it 'creates resources' do
      expect { post :create, format: :json }.to change(Post, :count).by(1)
    end
  end

  describe '#new' do

    before do
      request.path = '/posts/new'
      get :new, format: :json
    end

    it 'provides resource attributes' do
      expect(response.status).to eq(200)
    end
  end
end