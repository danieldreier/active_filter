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

# Task attributes are :title, :status, :list_id, :deadline, :created_at, :updated_at, :user_id

class Task < ActiveRecord::Base
  belongs_to :list
  before_create :set_user_id

  private 
    def set_user_id
      self.user_id = self.list.user.id 
    end
end