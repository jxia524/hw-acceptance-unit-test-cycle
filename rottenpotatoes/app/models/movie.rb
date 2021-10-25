class Movie < ActiveRecord::Base
    def self.sameDirector(title)
        if Movie.nil? || Movie.find_by_title(title).nil?
            return nil
        end
        director = Movie.find_by_title(title).director
        if director.blank?
            return nil 
        else
            return Movie.where(director: director).select(:title).collect{|a| a.title}
        end
    end
end
