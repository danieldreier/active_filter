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

    context 'with scope given' do 
      let(:filter) { ActiveFilter::Filter.new(scope: { user_id: 12 }, any: { foo: 'bar', bar: 'baz' }) }

      it 'creates a new filter' do 
        expect(filter).to be_an(ActiveFilter::Filter)
      end

      it 'stores the conditions and scope in instance variables' do 
        [:@conditions, :@scope].each {|var| expect(filter.instance_variables).to include(var) }
      end

      it 'deletes the :scope key from @conditions' do 
        expect(filter.conditions).to eql({any: { foo: 'bar', bar: 'baz' }})
      end
    end
  end

  describe 'instance methods' do 
    describe '#conditions' do 
      it 'returns conditions with which it was initialized' do 
        expect(filter.conditions).to eql({all: {foo: 'bar'}})
      end
    end

    describe '#get_scoped' do 
      before(:each) do 
        @users = FactoryGirl.create_list(:user_with_list, 3)
        @scope = { user_id: @users.first.id }
      end

      it 'returns the scoped subset' do 
        #
      end
    end
  end
end