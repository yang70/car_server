require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    xit "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    xit "loads all of the movies into @movies" do
      movie1, movie1 = Movie.create!(title: "Movie One"), Movie.create!(title: "Movie Two")
      get :index
      expect(assigns(:movies)).to match_array([movie1, movie2])
    end
  end
end
