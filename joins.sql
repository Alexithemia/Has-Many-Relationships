SELECT * 
  FROM users;

SELECT * 
  FROM posts
  WHERE user_id = 100;

SELECT 
posts.id, 
posts.user_id, 
posts.title, 
posts.url, 
posts.content, 
posts.created_at, 
posts.updated_at, 
users.first_name, 
users.last_name
  FROM posts 
  INNER JOIN users ON users.id = posts.user_id
  WHERE posts.user_id = 200;

SELECT 
posts.id, 
posts.user_id, 
posts.title, 
posts.url, 
posts.content, 
posts.created_at, 
posts.updated_at, 
users.username
  FROM posts 
  INNER JOIN users ON users.id = posts.user_id
  WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT 
users.username
  FROM users
  INNER JOIN posts ON users.id = posts.user_id
  WHERE posts.created_at > date '2015-01-01';

SELECT 
posts.title, 
posts.content, 
users.username
  FROM users
  INNER JOIN posts ON users.id = posts.user_id
  WHERE users.created_at < date '2015-01-01';

SELECT 
comments.id, 
comments.body, 
comments.created_at, 
comments.updated_at, 
comments.user_id, 
comments.post_id, 
posts.title AS post_title
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id;

SELECT comments.id, 
comments.body AS comments_body, 
comments.created_at, 
comments.updated_at, 
comments.user_id, 
comments.post_id, 
posts.title AS post_title, 
posts.url AS post_url
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id
    WHERE posts.created_at < date '2015-01-01';

SELECT 
comments.id, 
comments.body AS comments_body, 
comments.created_at, 
comments.updated_at, 
comments.user_id, 
comments.post_id, 
posts.title AS post_title, 
posts.url AS post_url
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id
    WHERE posts.created_at > date '2015-01-01';

SELECT 
comments.id, 
comments.body AS comments_body, 
comments.created_at, 
comments.updated_at, 
comments.user_id, 
comments.post_id, 
posts.title AS post_title, 
posts.url AS post_url
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id
    WHERE comments.body ~ 'USB';

SELECT 
posts.title AS post_title, 
users.first_name, 
users.last_name, 
comments.body AS comments_body
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  INNER JOIN comments ON comments.post_id = posts.id
    WHERE comments.body ~ 'matrix';

SELECT 
users.first_name, 
users.last_name, 
comments.body AS comments_body
  FROM comments
  INNER JOIN users ON comments.user_id = users.id
  INNER JOIN posts ON comments.post_id = posts.id
    WHERE comments.body ~ 'SSL' AND posts.content ~ 'dolorum';

SELECT 
users.first_name AS post_author_first_name, 
users.last_name AS post_author_last_name, 
posts.title AS post_title, 
  (SELECT users.username 
    FROM users 
    WHERE users.id = comments.user_id) AS comment_author_username, 
comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id
  INNER JOIN users ON posts.user_id = users.id
    WHERE (comments.body ~ 'SSL' OR comments.body ~ 'firewall')
    AND posts.content ~ 'nemo';

SELECT count(*)
  FROM comments
  INNER JOIN posts ON comments.post_id = posts.id
    WHERE posts.created_at > '2015-07-14';

SELECT count(*)
  FROM comments
  INNER JOIN users ON comments.user_id = users.id
    WHERE comments.body ~ 'programming';