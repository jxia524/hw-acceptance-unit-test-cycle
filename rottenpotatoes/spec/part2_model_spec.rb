require 'rails_helper'

describe Movie do
    it "should find movies by the same director" do
        Movie.create(title: "Star Wars", director: 'George Lucas')
        Movie.create(title: "THX-1138", director: 'George Lucas')
        expect(Movie.sameDirector('Star Wars')).to eql(['Star Wars', 'THX-1138'])
    end
    it "should not find movies by the same director" do
        Movie.create(title: "Star Wars", director: '')
       expect(Movie.sameDirector('Star Wars')).to eql(nil)
    end
end