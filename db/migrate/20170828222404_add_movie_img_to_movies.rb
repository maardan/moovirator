class AddMovieImgToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :movie_img, :string
  end
end
