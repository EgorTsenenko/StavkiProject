class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :password_digest
      t.timestamps
    end
    change_table :posts do |t|
      t.belongs_to :user
      end
    end
  end

