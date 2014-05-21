require 'spec_helper'

describe Hangar::ResourcesController do
  render_views

  describe '#create' do

    before do
      request.path = '/posts'
    end

    it 'creates resources' do
      expect { post :create, format: :json }.to change(Post, :count).by(1)
    end

    it 'returns newly-created resource' do
      post :create, format: :json
      expect(json.except('id')).to eq(FactoryGirl.create(:post).attributes.except('id'))
    end

    it 'accepts attributes' do
      post :create, post: { title: 'Fun adventure' }, format: :json
      expect(json['title']).to eq('Fun adventure')
    end
  end

  describe '#new' do

    before do
      request.path = '/posts/new'
    end

    context 'without attributes' do

      before do
        get :new, format: :json
      end

      it 'provides resource attributes' do
        expect(response.status).to eq(200)
      end

      it 'returns attributes' do
        expect(response.body).to eq(FactoryGirl.attributes_for(:post).to_json)
      end
    end

    context 'with attributes' do

      before do
        get :new, post: { title: 'Fun adventure' }, format: :json
      end

      it 'accepts attributes' do
        expect(json['title']).to eq('Fun adventure')
      end
    end
  end
end