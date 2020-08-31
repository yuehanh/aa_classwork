# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
    # Which countries have a GDP greater than every country in Europe? (Give the
    # name only. Some countries may have NULL gdp values)
    execute(<<-SQL)
    SELECT
        countries.name
    FROM
        countries
    WHERE
        countries.gdp > (
            SELECT
                MAX(gdp)
            FROM
                countries
            WHERE
                continent = 'Europe'
        )
    SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
    execute(<<-SQL)
    SELECT
        continent,  
        countries.name,
        countries.area
    FROM
        countries
    WHERE
        countries.area = (
            SELECT
                MAX(largest.area)
            FROM
                countries AS largest
            WHERE
                largest.continent = countries.continent
        )  
    SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
    execute(<<-SQL)
    SELECT
        countries.name,
        countries.continent
    FROM
        countries
    WHERE
        population > (
            SELECT
                3 * second.population
            FROM
                countries AS second
            WHERE
                second.continent = countries.continent
            ORDER BY
                population DESC
            OFFSET
                1
            LIMIT
                1
          )
    SQL
end
