class Review < ApplicationRecord
  after_create :movie_exists?

  # check if this particular movie exists in the movies DB or not
  def movie_exists? 
		if Movie.exists?(movie_id: self.movie_id)
		  Movie.update_average_rating(self.movie_id)
		else
			# if not, then add the first record (average rating becomes with first rating)
			new_movie_record = Movie.new(movie_id: self.movie_id, movie_title: self.movie_title, movie_img: self.movie_img, avg_rating: self.rating)
			new_movie_record.save!
		end
  end
end