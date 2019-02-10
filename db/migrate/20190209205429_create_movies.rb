class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies, id: false do |t|

      t.column :id,                 :integer, null: false
      t.column :id_genre,           :integer, null: false
      t.column :created_at,         :datetime,  default: -> {'CURRENT_TIMESTAMP'}
      t.column :original_title,     :string
      t.column :original_language,  :string
      t.column :title,              :string
      t.column :vote_average,       :float
    end
  end
end
