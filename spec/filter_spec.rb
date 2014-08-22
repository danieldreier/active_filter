require 'spec_helper'

describe ActiveFilter::Filter do 
  include ActiveFilter

  let(:filter) { ActiveFilter::Filter.new(all: { foo: 'bar' }) }

  describe '::initialize' do 
    it 'stores conditions in an instance variable' do 
      expect(filter.instance_variables).to include(:@conditions) 
    end
  end

  describe 'instance methods' do 
    describe '#conditions' do 
      it 'returns conditions with which it was initialized' do 
        expect(filter.conditions).to eql({all: {foo: 'bar'}})
      end
    end
  end
end