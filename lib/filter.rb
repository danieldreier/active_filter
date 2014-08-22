module ActiveFilter

  # ActiveFilter::Filter is a base class used to generate filters for ActiveRecord
  # resources. Its subclasses follow the naming scheme <class>Filter, where <class>
  # is the camel-cased name of an ActiveRecord::Base subclass.

  class Filter
    attr_reader :conditions
    
    # The conditions used in the initialize method will probably end up being
    # removed; instead, subclasses will be initialized with conditions through the larger
    # ActiveFilter module.
    
    def initialize(conditions)
      @conditions = conditions
    end
  end
end