require 'spec_helper'

describe 'Factory routing' do
  it 'provides #create route' do
    expect(post('/posts')).to route_to('hangar::resources#create')
  end  
  it 'provides #new route' do
    expect(get('/posts/new')).to route_to('hangar::resources#new')
  end  
end