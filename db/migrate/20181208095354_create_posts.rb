# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string     :name
      t.text       :content
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
