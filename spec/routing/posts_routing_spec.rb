require 'spec_helper'

describe 'Post routing' do
  it 'provides #create route' do
    expect(post('/posts')).to route_to('posts#create')
  end  
  it 'provides #update route' do
    expect(patch('/posts/1')).to route_to('posts#update', id: 1.to_s)
  end  
  it 'provides #new route' do
    expect(get('/posts/new')).to route_to('posts#new')
  end  
  it 'provides #show route' do
    expect(get('/posts/1')).to route_to('posts#show', id: 1.to_s)
  end  
  it 'provides #delete route' do
    expect(delete('/posts/1')).to route_to('posts#destroy', id: 1.to_s)
  end  
  it 'provides #index route' do
    expect(get('/posts')).to route_to('posts#index')
  end  
end