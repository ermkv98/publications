class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :region
      t.integer :status
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
      t.belongs_to :author, foreign_key: { to_table: :users }
    end
  end
end
