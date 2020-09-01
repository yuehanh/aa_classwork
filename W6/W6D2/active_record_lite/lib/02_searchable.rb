require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
    def where(params)
        # ...
        search_line = params.map { |key, _| "#{key} = ?" }.join(' AND ')
        results = DBConnection.execute(<<-SQL, *params.values)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          #{search_line}
        SQL
        parse_all(results)
    end
end

class SQLObject
    # Mixin Searchable here...
    extend Searchable
end
