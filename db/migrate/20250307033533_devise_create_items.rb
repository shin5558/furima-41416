# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string :name,                   null: false
      t.text :description,              null: false
      t.integer :category_id,           null: false
      t.integer :condition_id,          null: false
      t.integer :shipping_fee_id,       null: false
      t.integer :prefecture_id,         null: false
      t.integer :delivery_days_id,      null: false
      t.integer :price,                 null: false
      t.references :user, null: false, foreign_key: true

      ## Database authenticatable
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    # add_index :items, :email,                unique: true
    # add_index :items, :reset_password_token, unique: true
    # add_index :items, :confirmation_token,   unique: true
    # add_index :items, :unlock_token,         unique: true
  end
end
