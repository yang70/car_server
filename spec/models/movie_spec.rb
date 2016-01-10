require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a title" do
    movie_1 = Movie.create!(title: "Movie One")
    expect(movie_1.title).to eq("Movie One")
  end

  it "requires a title" do
    movie = Movie.create(title: nil)
    expect(movie).to be_invalid
  end
end

