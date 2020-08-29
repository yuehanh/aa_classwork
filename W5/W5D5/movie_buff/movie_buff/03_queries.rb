def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.joins(:actors).where(actors: {name: those_actors}).select(:title, :id)
end

def golden_age
  # Find the decade with the highest average movie score.
  # Actor.joins(:castings).where.not("castings.ord = 1").group(:id).order("COUNT(*) DESC").limit(3).select(:id, :name, "COUNT(*) as roles")

  Movie.group("yr / 10").order("AVG(score) DESC").select('yr/10')
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  subquery = Movie.joins(:actors).where(actors: {name: name}).select(:title)

  Actor.joins(:movies).where(movies: {title: subquery}).select(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_outer_joins(:castings).where(castings: {movie_id: nil}).count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.
  
  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but


  # not like "stallone sylvester" or "zylvester ztallone"
  actors = Actor.all.pluck(:name)
  actors.select! {|actor| similar_name(actor, whazzername)}

  Movies.joins(:actors).where(actors: {name: actors} ).select(:title)
  
end

def similar_name(stal,whazz)
  i = 0
  stal.each_char do |el|
    if whazz[i] == el
      i += 1
      return true if i == whazz.length
    end
  end
  false
end


def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor.joins(:movies).group(:id).order("(MAX(movies.yr) - MIN(movies.yr)) DESC").order(:name).limit(3).select(:id, :name, "(MAX(movies.yr) - MIN(movies.yr)) AS career")
end
