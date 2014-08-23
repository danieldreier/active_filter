require 'spec_helper'

describe ActiveFilter::Filter do 
  include ActiveFilter

  let(:filter) { ActiveFilter::Filter.new(all: { foo: 'bar' }) }

  describe '::initialize' do 
    context 'with valid parameters' do 
      it 'stores conditions in an instance variable' do 
        expect(filter.instance_variables).to include(:@conditions) 
      end
    end

    context 'with invalid conditions' do 
      it 'raises an argument error' do 
        expect{ ActiveFilter::Filter.new({foo: 'bar'})}.to raise_error
      end
    end

    context 'with some invalid keys' do 
      let(:filter) { ActiveFilter::Filter.new(foo: 'bar', all: { bar: 'baz' })}

      it 'doesn\'t raise an error' do 
        expect{ filter }.not_to raise_error
      end

      it 'only stores valid conditions' do 
        expect(filter.conditions).to eql({all: {bar: 'baz'}})
      end
    end
  end

  describe 'instance methods' do 
    describe '#conditions' do 
      it 'returns conditions with which it was initialized' do 
        expect(filter.conditions).to eql({all: {foo: 'bar'}})
      end
    end

    describe 'filter' do 
      #
    end
  end
end