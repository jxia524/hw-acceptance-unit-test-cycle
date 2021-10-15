class Movie < ActiveRecord::Base
    def self.sameDirector(title)
        director = Movie.find_by_title(title).director
        if director.blank?
            return nil 
        else
            return Movie.where(director: director).select(:title).collect{|a| a.title}
        end
    end
end
