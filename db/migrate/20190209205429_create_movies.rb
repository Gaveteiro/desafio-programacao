class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies, primary_key: :movie_id do |t|
      t.column :created_at,         :datetime, raw_default: 'NOW()'
      t.column :original_title,     :string
      t.column :original_language,  :string
      t.column :title,              :string
      t.column :vote_average,       :float
    end
  end
end
