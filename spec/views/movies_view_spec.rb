require 'rails_helper'

RSpec.describe "movies/index", :type => :view do
  it "renders _movie partial for each movie" do
    assign(:movies, [Movie.create!(title: "Title 1", year: "2015"), Movie.create!(title: "Title 2", year: "2015")])
    render
    expect(view).to render_template(:partial => "_movie", :count => 2)
  end
end

