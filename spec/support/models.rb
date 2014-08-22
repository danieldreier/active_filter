require 'active_record'

class User < ActiveRecord::Base
  has_one :list
end

class List < ActiveRecord::Base 
  belongs_to :user
  has_many :tasks
end

class Task < ActiveRecord::Base
  belongs_to :list
end