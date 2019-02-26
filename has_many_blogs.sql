DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs

DROP TABLE IF EXISTS users;
CREATE TABLE users
  (
    id SERIAL PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90),
    last_name VARCHAR(90),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
  );

DROP TABLE IF EXISTS posts;
CREATE TABLE posts
  (
    id SERIAL PRIMARY KEY,
    title VARCHAR(180),
    url VARCHAR(510),
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    user_id INTEGER REFERENCES users(id)
  );

DROP TABLE IF EXISTS comments;
CREATE TABLE comments
  (
    id SERIAL PRIMARY KEY,
    body VARCHAR(510),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id)
  );

\i scripts/blog_data.sql