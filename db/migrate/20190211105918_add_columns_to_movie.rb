class AddColumnsToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :popularity, :float
    add_column :movies, :adult, :boolean
    add_column :movies, :poster_path, :string
    add_column :movies, :overview, :string
    add_column :movies, :backdrop_path, :string
    add_column :movies, :vote_count, :integer
  end
end
