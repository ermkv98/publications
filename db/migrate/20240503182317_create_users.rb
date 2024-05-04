# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.string :third_name
      t.string :region
      t.integer :role

      t.timestamps
    end
  end
end
