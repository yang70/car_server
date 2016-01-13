require 'rails_helper'

RSpec.describe "movies/index", :type => :view do
  it "renders _movie partial for each movie" do
    assign(:movies, [double(Movie), double(Movie)])
    render
    expect(view).to render_template(:partial => "_movie", :count => 2)
  end
end

