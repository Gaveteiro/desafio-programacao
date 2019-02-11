class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres, primary_key: :genre_id do |t|
      t.column :name,       :string,    null: false
      t.column :created_at, :datetime,  raw_default: 'NOW()'
    end
  end
end
