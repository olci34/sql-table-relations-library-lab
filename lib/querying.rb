def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year
  FROM Books WHERE Books.series_id = 1 ORDER BY(Books.year);"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters ORDER BY (LENGTH(characters.motto)) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS 'quantity'
  FROM Characters GROUP BY(species) ORDER BY(quantity) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM Authors
  INNER JOIN Series
  ON Authors.id = Series.author_id
  JOIN Subgenres
  ON Subgenres.id = Series.subgenre_id;"
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Series
  INNER JOIN Books
  ON Series.id = Books.series_id
  JOIN Character_books
  ON Books.id = Character_books.book_id
  JOIN Characters
  ON Character_books.character_id = Characters.id
  GROUP BY(Characters.species)
  ORDER BY(COUNT(*)) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(Books.title)
  FROM Characters
  JOIN Character_books
  ON Characters.id = Character_books.character_id
  JOIN Books
  ON Character_books.book_id = Books.id
  GROUP BY(Characters.name)
  ORDER BY (COUNT(Books.title)) DESC, Characters.name;"
end
