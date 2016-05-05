# SELECT *
# FROM
#   users;
User.all

# SELECT *
# FROM
#   users
# WHERE
#   user.id = 1;
User.find(1)

# SELECT *
# FROM
#   posts
# ORDER BY
#   created_at DESC
# LIMIT 1;
Post.order(:created_at => :desc)
  .limit(1)

# SELECT *
# FROM
#   users
# JOIN
#   posts
# ON
#   posts.author_id = users.id
# WHERE
#   posts.created_at >= '2014-08-31 00:00:00';
User.joins(:posts)
  .where('created_at >= 2014-08-31 00:00:00')


# SELECT
#   count(*)
# FROM
#   users
# GROUP BY
#   favorite_color
# HAVING
#   count(*) > 1;
User.select('COUNT(*) AS num_users')
  .group('favorite_color')
  .having('num_users > 1')


# * The most recently updated user
User.order(:updated_at => :desc)
  .limit(1)

# * The oldest user (by age)
User.order(:birthdate)
  .limit(1)

# * all the users
User.all

# * all posts sorted in descending order by date created
Post.order(:created_at => :desc)

# ---------------------------------------------

# Find the author and title of the first post of the blog
Post.joins(:author)
  .order(:created_at)
  .limit(1)

# Count the number of posts written by an author with a birthday on April, group by author
# Postgres/MySQL/SQL Server etc...
Post.joins(:authors)
  .where('EXTRACT(MONTH FROM posts.created_at) = 4')
  .group('authors.id')
  .count('posts.author_id')
# SQLite
Post.joins(:authors)
  .where('strftime(%m, posts.created_at) = 4')
  .group('authors.id')
  .count('posts.author_id')


# Count the total number of blog posts written each year, group by year, order by year
Post.select('DATEPART(yyyy, created_at) AS year')
  .group(:year)
  .order(:year)
  .count












