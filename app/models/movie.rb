class Movie < ActiveRecord::Base
  require 'net/http'
  require 'json'
  require 'open-uri'
  require_relative '../../lib/check_internet'

  validates :title, :year, presence: true

  def self.get_all_cover_art
    if internet?
      movies = Movie.where(poster_link: nil)

      if movies.empty?
        return "All movies have art"
      else
        movies.each do |movie|
          movie.get_art
        end
      end
    else
      raise 'No internet connection'
    end
  end

  def get_art
    # set title and year from Movie object
    current_movie = self
    title = self.title
    year = self.year

    # create parameters for query to www.omdbapi.com
    search_title = title.gsub(' ', '+')
    search_string = "/?t=#{search_title}&y=#{year}&r=json"

    # query movie and parse the json response
    response = Net::HTTP.get_response('www.omdbapi.com', search_string)
    data = JSON.parse response.body
    puts data

    # set the poster art url and set the data to poster_response
    poster = data["Poster"].slice(33..-1)
    poster_string = "/images/M#{poster}"
    poster_response = Net::HTTP.get_response('ia.media-imdb.com', poster_string)

    # create file name for the poster art
    save_title = title.gsub(' ', '_').downcase + '_poster.jpg'
    
    # set current directory and specify save location
    current_dir = Dir.pwd
    Dir.chdir(current_dir + '/app/assets/images')

    # save file to the file system
    File.open(save_title, 'wb') do |f|
      f.write poster_response.body
    end

    # change back to root directory
    Dir.chdir(current_dir)

    current_movie.poster_link = save_title
    current_movie.save
  end
end
