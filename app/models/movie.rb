class Movie < ApplicationRecord
	has_many :reviews

	# take the list of top movies from themoviedb.org API response then generate our data accordingly
	require 'uri'
	require 'net/http'

	url = URI("https://api.themoviedb.org/3/movie/top_rated?page=1&language=en-US&api_key=6269da4e9a0050f1029435028ca838d9")

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE

	request = Net::HTTP::Get.new(url)
	request.body = "{}"

	response = http.request(request)
	@curr_top_movies = JSON.parse(response.read_body)['results']	

	def self.current_top_movies
		@curr_top_movies
	end

	def self.sort_movies(id)
		case id
			when 0
			  return @curr_top_movies = @curr_top_movies.sort_by {|obj| obj['id']}
			when 1
			  return @curr_top_movies.sort_by {|obj| obj['original_title']}
			when 2
			  return @curr_top_movies.sort_by {|obj| genre_decoder[obj['genre_ids'][0]] }
			when 3
			  return @curr_top_movies.sort_by {|obj| obj['release_date']}
			else
			 	return @curr_top_movies
		end
	end

	def self.genre_decoder
		{28=>"Action",12=>"Adventure",16=>"Animation",35=>"Comedy",80=>"Crime",99=>"Documentary",18=>"Drama",10751=>"Family",14=>"Fantasy",36=>"History",27=>"Horror",10402=>"Music",9648=>"Mystery",10749=>"Romance",878=>"Science Fiction",10770=>"TV Movie",53=>"Thriller",10752=>"War",37=>"Western"}
	end

  def self.update_average_rating(m_id)
		new_avg = Review.where(movie_id: m_id).average(:rating)
    self.where(movie_id: m_id).update_all(avg_rating: new_avg)
  end
end