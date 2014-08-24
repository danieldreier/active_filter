require 'factory_girl'

module TaskStatus
  def self.random_status
    ['new', 'in progress', 'blocking', 'complete'].shuffle.first
  end
end

FactoryGirl.define do 
  factory :user do 
    sequence(:username) {|n| "user-#{n}" }
    sequence(:birthdate) {|n| Time.utc(rand(1950..1995),rand(1..12),n) }
    sequence(:is_admin) {|n| n.even? ? false : true }

    factory :user_with_list do 
      after(:create) do |user|
        create(:list_with_tasks, user: user)
      end
    end
  end

  factory :list do 
    association :user
    name 'My List'

    factory :list_with_tasks do 
      ignore do 
        tasks_count 5
      end

      after(:create) do |list, evaluator|
        create_list(:task, evaluator.tasks_count, list: list)
      end
    end
  end

  factory :task do 
    association :list
    sequence(:title) {|n| "Task #{n}" }
    sequence(:status) {|n| TaskStatus.random_status}
    sequence(:deadline) {|n| Time.utc(2014,10,rand(1..31)) }
  end
end