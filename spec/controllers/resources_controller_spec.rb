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
      expect(json.except('id')).to eq(FactoryBot.create(:post).attributes.except('id'))
    end

    it 'accepts attributes' do
      post :create, params: { post: { title: 'Fun adventure' } }, format: :json
      expect(json['title']).to eq('Fun adventure')
    end

    it "accepts includes defining the association's columns" do
      post :create, params: { post: { title: 'Fun adventure' }, include: { comments: { only: :text } } },  format: :json
      expect(json['title']).to eq('Fun adventure')
      expect(json['comments'].count).to eq(5)
      # this can be a custom matcher as well
      expect(json['comments']).to all(
        satisfy("have only key 'text'") { |comment| (comment.keys - ['text']).empty? }
      )
    end

    it 'accepts includes defining associations' do
      post :create, params: { post: { title: 'Fun adventure' }, include: "comments" },  format: :json
      expect(json['title']).to eq('Fun adventure')
      expect(json['comments'].count).to eq(5)
    end

    it 'accepts traits' do
      post :create, params: { traits: ['trait'] }, format: :json
      expect(json['title']).to eq('Title changed by trait')
    end

    context 'when route has a namespace' do
      before do
        Hangar.route_namespace = :factory
        Rails.application.reload_routes!
        request.path = '/factories/posts'
      end

      after do
        Hangar.route_namespace = nil
        Rails.application.reload_routes!
      end

      it 'creates resources' do
        expect { post :create, format: :json }.to change(Post, :count).by(1)
      end
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
        expect(response.body).to eq(FactoryBot.attributes_for(:post).to_json)
      end
    end

    context 'with attributes' do

      before do
        get :new, params: { post: { title: 'Fun adventure' } }, format: :json
      end

      it 'accepts attributes' do
        expect(json['title']).to eq('Fun adventure')
      end
    end

    context 'with trait' do

      before do
        get :new, params: { traits: ['trait'] }, format: :json
      end

      it 'accepts traits' do
        expect(json['title']).to eq('Title changed by trait')
      end
    end

    context 'when route has a namespace' do
      before do
        Hangar.route_namespace = :factory
        Rails.application.reload_routes!
        request.path = '/factories/posts'
      end

      after do
        Hangar.route_namespace = nil
        Rails.application.reload_routes!
        request.path = '/'
      end

      before do
        get :new, format: :json
      end

      it 'provides resource attributes' do
        expect(response.status).to eq(200)
      end

      it 'returns attributes' do
        expect(response.body).to eq(FactoryBot.attributes_for(:post).to_json)
      end
    end
  end
end
