require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
    def self.columns
        # ...
        return @columns if @columns

        cols = DBConnection.execute2(<<-SQL).first
          SELECT
            *
          FROM
            #{table_name}
        SQL
        @columns = cols.map(&:to_sym)
    end

    def self.finalize!
        columns.each do |column|
            define_method(column) do
                attributes[column]
            end

            define_method("#{column}=") do |value|
                attributes[column] = value
            end
        end
    end

    class << self
        attr_writer :table_name
    end

    def self.table_name
        # ...
        @table_name ||= name.tableize
    end

    def self.all
        results = DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
        SQL

        parse_all(results)
    end

    def self.parse_all(results)
        # ...
        results.map { |param| new(param) }
    end

    def self.find(id)
        # ...
        result = DBConnection.execute(<<-SQL, id)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          id = ?
        SQL
        result.first ? new(result.first) : nil
    end

    def initialize(params = {})
        # ...
        params.each do |key, value|
            key = key.to_sym
            raise "unknown attribute '#{key}'" unless self.class.columns.include?(key)

            send("#{key}=", value)
        end
    end

    def attributes
        # ...
        @attributes ||= {}
    end

    def attribute_values
        # ...
        self.class.columns.map { |attribute| send(attribute) }
    end

    def insert
        # ...
        p self.class.columns
        col_names = self.class.columns.drop(1)
        question_marks = (['?'] * col_names.length).join(', ')
        col_names = col_names.join(', ')
        DBConnection.execute(<<-SQL, *attribute_values.drop(1))
        INSERT INTO
            #{self.class.table_name} (#{col_names})
        VALUES
            (#{question_marks})
        SQL

        self.id = DBConnection.last_insert_row_id
    end

    def update
        # ...
        set_line = self.class.columns.map { |key| "#{key} = ?" }.join(', ')

        DBConnection.execute(<<-SQL, *attribute_values, id)
            UPDATE
                #{self.class.table_name}
            SET
                #{set_line}
            WHERE
                #{self.class.table_name}.id = ?
        SQL
    end

    def save
        # ...
        id.nill ? insert : update
    end
end
