require 'spec_helper'

describe ActiveFilter::Filter do 
  include ActiveFilter

  let(:filter) { ActiveFilter::Filter.new(foo: 'bar') }

  it 'initializes with a set of conditions' do 
    expect(filter.instance_variables).to include(:@conditions) 
  end
end