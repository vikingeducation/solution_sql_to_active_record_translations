-- Post.all
SELECT * FROM posts
;

-- Post.first
SELECT * FROM posts
  LIMIT 1
;

-- Post.last
SELECT * FROM posts
  ORDER BY id DESC
  LIMIT 1
;

-- Post.where(:id => 4)
SELECT * FROM posts
  WHERE id = 4
  LIMIT 1
;

-- Post.find(4)
SELECT * FROM posts
  WHERE id = 4
;

-- User.count
SELECT COUNT(*) FROM users
;

-- Post.select(:name).where(:created_at > 3.days.ago).order(:created_at)
SELECT name FROM posts
  WHERE created_at > CURRENT_DATE - 3
  ORDER BY created_at
;

-- Post.select("COUNT(*)").group(:category_id)
SELECT COUNT(*) FROM posts
  GROUP BY category_id
;

-- All posts created before 2014
SELECT * FROM posts
  WHERE created_at < '2014-1-1'
;

-- A list of all (unique) first names for authors who have written at least 3 posts
SELECT DISTINCT
  authors.first_name,
  COUNT(posts.author_id) AS num_posts
  FROM posts
  JOIN authors ON authors.id = posts.author_id
  GROUP BY authors.first_name, authors.id
  HAVING COUNT(posts.author_id) >= 3
;

      

-- The posts with titles that start with the word "The"
SELECT * FROM posts
  WHERE title LIKE 'The %'
;

-- Posts with IDs of 3,5,7, and 9
SELECT * FROM posts
  WHERE id IN (3, 5, 7, 9)
;

-- ------------------------------------

-- Find the author and title of the first post of the blog
SELECT
  CONCAT(authors.first_name, ' ', authors.last_name) AS author_name,
  posts.title
  FROM posts
  JOIN authors ON authors.id = posts.author_id
  ORDER BY posts.created_at
  LIMIT 1
;

-- Count the number of posts written by an author with a birthday on April, group by author
SELECT
  CONCAT(authors.first_name, ' ', authors.last_name) AS author_name,
  COUNT(posts.author_id)
  FROM posts
  JOIN authors ON authors.id = posts.author_id
  WHERE DATEPART(mm, authors.birthday) = 4
  GROUP BY author_name
;

-- Count the total number of blog posts written each year, group by year, order by year
SELECT
  DATEPART(yyyy, created_at) AS year,
  COUNT(*) AS num_posts
  FROM posts
  GROUP BY year
  ORDER BY year
;















