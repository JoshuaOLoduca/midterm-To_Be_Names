-- Drop and recreate Users table (Example)

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
);

DROP TABLE IF EXISTS maps CASCADE;
CREATE TABLE maps (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
  city VARCHAR(255),
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  cover_img VARCHAR(255) NOT NULL,
  public BOOLEAN DEFAULT TRUE
);

DROP TABLE IF EXISTS places ON CASCADE;
CREATE TABLE places (
  id SERIAL PRIMARY KEY NOT NULL,
  longitude NUMERIC NOT NULL,
  latitude NUMERIC NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  img_url TEXT,
  map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS collaborators CASCADE;
CREATE TABLE collaborators
user_id iNTEGER REFERENCES users(id) ON DELETE CASCADE
map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE

DROP TABLE IF EXISTS user_likes CASCADE;
CREATE TABLE user_likes
user_id iNTEGER REFERENCES users(id) ON DELETE CASCADE
map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE

DROP TABLE IF EXISTS user_fabourites CASCADE;
CREATE TABLE user_favourites
user_id iNTEGER REFERENCES users(id) ON DELETE CASCADE
map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE




