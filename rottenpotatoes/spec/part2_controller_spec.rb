require 'rails_helper'

describe MoviesController, type: :request do
    it "finds movies with same director" do
        Movie.stub(:sameDirector).with('withSimilar').and_return(['Star Wars', 'THX-1138'])
        expect(Movie.sameDirector('withSimilar')).to eq(['Star Wars', 'THX-1138'])
        #get '/search', params: { title: 'Star Wars' }
        #I don't know why the above doesnt work, if I do ">rake routes" the route is there:
        #    search GET    /search/:title(.:format)   movies#search
        #but I always get a routing error with: No route matches [GET] "/search"
        get '/search/withSimilar'
        expect(response).to have_http_status(200)
        expect(response.body).to include('Star Wars')
        expect(response.body).to include('THX-1138')
    end
    
    it "does not find movies with same director" do 
        Movie.stub(:sameDirector).with('withoutSimilar').and_return(nil) 
        expect(Movie.sameDirector('withoutSimilar')).to eq(nil)
        get '/search/withoutSimilar'
        expect(response).to redirect_to(root_url + "movies")
    end
end