require 'spec_helper'

describe 'Factory routing' do
  HANGAR_HEADERS = {
    'HTTP_ACCEPT' => 'application/json',
    'HTTP_FACTORY' => 'hangar'
  }

  before do
    Rack::MockRequest::DEFAULT_ENV.merge! HANGAR_HEADERS
  end

  it 'provides #create route' do
    expect(post: '/posts').to route_to('hangar/resources#create')
  end

  it 'provides #new route' do
    expect(get: '/posts/new').to route_to('hangar/resources#new')
  end  

  it 'provides global #delete route' do
    expect(delete: '/').to route_to('hangar/records#delete')
  end  

  after do
    HANGAR_HEADERS.keys.each do |k|
      Rack::MockRequest::DEFAULT_ENV.delete k
    end
  end
end