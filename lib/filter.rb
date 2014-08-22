module ActiveFilter

  # ActiveFilter::Filter is a base class used to generate filters for ActiveRecord
  # resources. Its subclasses follow the naming scheme ++<class>Filter++, where <class>
  # is the camel-cased name of an ActiveRecord::Base subclass.

  class Filter
    attr_reader :conditions
    
    # The conditions used in the initialize method will probably end up being
    # removed; instead, subclasses will be initialized with conditions through the larger
    # ActiveFilter module.

    # Conditions take the form of a hash. Hash keys may include ++:all++, ++:any++, and ++:none++,
    # each of which points to a hash of attributes for the ActiveRecord model being filtered.
    # The ++:all++, ++:any++, and ++:none++ keys function as logical AND, OR, and NOT operators, and may be
    # nested. For example, given a model ++Task++ with attributes ++:priority++, ++status++, and 
    # ++category++, a ++TaskFilter++ could be initialized with the following conditions:
    #   ++{all: { priority: ['urgent', 'high'], status: 'incomplete' }}++

    # The filter would then return all incomplete tasks whose status was either 'urgent' or 'high'.

    def initialize(conditions)
      @conditions = conditions
    end
  end
end