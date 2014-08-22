module ActiveFilter
  class Filter
    attr_reader :conditions
    
    def initialize(conditions)
      @conditions = conditions
    end
  end
end