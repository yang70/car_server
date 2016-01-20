require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a title" do
    movie_1 = Movie.create!(title: "Movie One", year: "2015")
    expect(movie_1.title).to eq("Movie One")
    expect(movie_1.year).to eq("2015")
  end

  it "requires a title" do
    movie = Movie.create(title: nil, year: "2015")
    expect(movie).to be_invalid
  end

  it "requires a year" do
    movie = Movie.create(title: "Movie", year: nil)
    expect(movie).to be_invalid
  end
end

