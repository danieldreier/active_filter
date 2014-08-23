require 'active_support/core_ext/object/blank.rb'

module ActiveFilter

  # ActiveFilter::Filter is a base class used to generate filters for ActiveRecord
  # resources. Its subclasses follow the naming scheme ++<class>Filter++, where <class>
  # is the camel-cased name of an ActiveRecord::Base subclass.

  class Filter

    ALLOWED_KEYS = [ :all, :any, :none ]

    # ++#conditions++ returns the value of the ++@conditions++ instance variable, which stores
    # the conditions passed to the Filter class on ++::initialize++.

    # ++#scope++ returns the value of ++@scope++, which is taken from the ++conditions++ hash on
    # ++::initialize++.

    attr_reader :conditions, :scope
    
    # The conditions used in the initialize method will probably end up being
    # removed; instead, subclasses will be initialized with conditions through the larger
    # ActiveFilter module.
    #
    # The ++conditions++ parameter is a hash. Keys may include ++:all++, ++:any++, and ++:none++,
    # each of which points to a hash of attributes for the ActiveRecord model being filtered.
    # The ++:all++, ++:any++, and ++:none++ keys function as logical AND, OR, and NOT operators, and may be
    # nested. For example, given a model ++Task++ with attributes ++:priority++, ++status++, and 
    # ++category++, a ++TaskFilter++ could be initialized with the following conditions:
    #   ++{all: { priority: ['urgent', 'high'], status: 'incomplete' }}++
    #
    # The optional ++scope++ key stands for the initial scope of the ActiveRecord model being filtered.
    # For a model called ++Comment++, the scope could be:
    #   ++{user_id: 2}++
    # Then the filter would be applied only to comments belonging to user 2.
    #
    # The filter would then return all incomplete tasks whose status was either 'urgent' or 'high'.

    def initialize(conditions)
      @scope = conditions.delete(:scope)
      raise ArgumentError unless (@conditions = sanitize!(conditions)).present?
    end

    protected 

    # Sanitizes a given ++conditions++ hash and checks its keys. 
    # Returns the sanitized Hash, containing only allowed keys.

      def sanitize!(conditions)
        conditions.reject {|key, value| !ALLOWED_KEYS.include?(key) }
      end
  end
end