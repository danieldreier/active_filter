require 'active_record'

# User attributes are :username, :birthdate, :is_admin (default false), :created_at, :updated_at

class User < ActiveRecord::Base
  has_one :list
end

# List attributes are :name, :description, :user_id, :created_at, :updated_at

class List < ActiveRecord::Base 
  belongs_to :user
  has_many :tasks
end

# Task attributes are :title, :status, :list_id, :deadline, :created_at, :updated_at

class Task < ActiveRecord::Base
  belongs_to :list
end