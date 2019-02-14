class AddColumnReleaseDateToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :release_date, :string
  end
end
