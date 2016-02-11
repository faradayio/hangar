require 'spec_helper'

describe 'Root routing', type: :routing do
  it 'serves posts#index' do
    expect(get('/')).to route_to('posts#index')
  end  
end