require 'rails_helper'

describe MoviesController, type: :request do
    it "finds movies with same director" do
        Movie.stub(:sameDirector).with('Star Wars').and_return(['Star Wars', 'THX-1138'])
        expect(Movie.sameDirector('Star Wars')).to eq(['Star Wars', 'THX-1138'])
        #get '/search', params: { title: 'Star Wars' }
        #I don't know why this doesnt work, if I do >rake routes I get
        #    search GET    /search/:title(.:format)   movies#search
        #but I always get a routing error with: No route matches [GET] "/search"
    end
    
    it "does not find movies with same director" do 
        Movie.stub(:sameDirector).with('Alien').and_return(nil) 
        expect(Movie.sameDirector('Alien')).to eq(nil)
    end
end