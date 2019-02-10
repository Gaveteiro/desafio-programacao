class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres, id: false do |t|
      t.column :id,         :integer,   null: false
      t.column :name,       :string,    null: false
      t.column :created_at, :datetime,  default: -> {'CURRENT_TIMESTAMP'}
    end
  end
end
