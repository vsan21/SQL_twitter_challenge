CREATE TABLE user (
  id INTEGER,
  name TEXT,
  joined DATE
);

CREATE TABLE tweets (
  user_id INTEGER,
  tweet TEXT,
  post_date DATE
);

CREATE TABLE follow (
  user_id INTEGER,
  follower_id INTEGER
);

INSERT INTO user VALUES
(1, 'Tobin', "2018-01-18"),
(2, 'Christine', "2015-04-09"),
(3, 'Jax', "2006-11-11"),
(4, 'Taylor', "2012-09-24"),
(5, 'Ella', "2017-01-28");

INSERT INTO tweets VALUES
(1, 'first tweet wooooo!', '2018-01-18'),
(1, 'Learning about SQL', '2018-03-15'),
(2, 'Hungry...', '2015-07-15'),
(2, 'New Year so time to hit the gym...eh maybe next year', '2016-01-02'),
(2, 'Today is the best day EVER', '2017-10-21'),
(3, 'EXCIITTEEDD', '2009-12-24'),
(3, '....', '2008-02-14'),
(3, '11:11 WOO', '2011-11-11'),
(3, "It's gonna be May", '2015-04-30'),
(4, 'Just chilling with my dogs', '2014-07-24'),
(4, 'Food coma...', '2017-11-24'),
(5, 'Mongo makes me want mango', '2017-09-04');

-- 2nd parameter is id of person following the user_id (i.e. 1 has 4 followers)
INSERT INTO follow VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(4, 1),
(5, 1),
(5, 3),
(5, 4);

-- All the tweets by a given user
SELECT user_id, tweet
FROM tweets;

-- 10 most recent tweets
SELECT tweet, post_date
FROM tweets
ORDER BY post_date DESC
LIMIT 10;

-- Join to get a user's info along with their tweets
SELECT id, name, tweet
FROM user
JOIN tweets
  ON user.id = tweets.user_id;

-- Find which user has the most follower
SELECT user_id, COUNT(follower_id)
FROM follow
GROUP BY 1;
