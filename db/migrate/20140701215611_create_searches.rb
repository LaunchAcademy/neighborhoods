class CreateSearches < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.connection.execute <<-SQL
    CREATE VIEW searches AS
      SELECT  neighborhoods.id AS searchable_id, neighborhoods.name AS term,
              CAST ('Neighborhood' AS varchar) AS searchable_type
      FROM neighborhoods
      UNION
      SELECT  reviews.id AS searchable_id, reviews.description AS term,
              CAST ('Review' AS varchar) AS searchable_type
      FROM reviews
    SQL
  end

  def self.down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP VIEW searches
    SQL
  end
end
