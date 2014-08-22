class CreateUsersListsAndTasks < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.date :birthdate
      t.boolean :is_admin, default: false

      t.timestamps
    end

    create_table :lists do |t|
      t.string :name
      t.text :description
      t.references :user 

      t.timestamps
    end

    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.references :list
      t.datetime :deadline

      t.timestamps
    end
  end
end
