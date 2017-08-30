class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.integer :movie_id
      t.string :movie_title
      t.integer :avg_rating

      t.timestamps
    end
  end
end
