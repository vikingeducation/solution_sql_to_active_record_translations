solution_sql_to_active_record_translations
==========================================








## Overview

This assignment connected the dots between ActiveRecord and SQL. Getting through this and understanding allows you to "see the SQL through the ActiveRecord" so to speak.



## Reviewing Your Solution

While reviewing your solution you should ask the following questions:

### SQL to ActiveRecord

* Most of these are one liners, did you find yourself writing much more than that?
* Did you save aggregate functions for the final call when chaining? Why is this important?


### ActiveRecord to SQL

* Are you able to clearly identify the ActiveRecord method that corresponds to the SQL?
* How did you go about setting a condition when using an aggregate function? Did you find yourself using `HAVING`?


## Introducing Our Solution

The solution for translations from ActiveRecord Ruby to SQL is in `active_record_to_sql.sql`. The solution for SQL to ActiveRecord Ruby is in `sql_to_active_record.rb`.



## Key Tips and Takeaways

1. **Use a SQL console if you have one!** If you have a console like [psql](http://www.postgresql.org/docs/9.1/static/app-psql.html) take advantage of it! Write your SQL in an SQL file and copy/paste it into the console to run it. This can sometimes be faster and feel more like writing SQL (because it is) than using the Rails console.


1. **Use `HAVING` when applying conditional logic to aggregate functions.** You cannot use a `WHERE` clause with an aggregate function. You have to use `HAVING`. When you want to attach conditional logic to an aggregate funciton or `GROUP BY`, `HAVING` is what you must use. Read more [here](http://stackoverflow.com/questions/287474/whats-the-difference-between-having-and-where).

    ```sql
    -- A list of all (unique) first names for authors who have written at least 3 posts
    SELECT DISTINCT
      authors.first_name,
      COUNT(posts.author_id) AS num_posts
      FROM posts
      JOIN authors ON authors.id = posts.author_id
      HAVING num_posts >= 3
    ;
    ```





** NOTE:** *This solution repo is copyrighted material for your private use only and not to be shared outside of Viking Code School.*













