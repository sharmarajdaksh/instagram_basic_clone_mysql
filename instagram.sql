DROP DATABASE instagram;
CREATE DATABASE instagram;
 
 USE instagram;
 
 CREATE TABLE users (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    comment_text TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photos) REFERENCES photos(id)
);

CREATE TABLE likes (
--     id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY_KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

-- INSERT INTO users (username) 
-- VALUES 
--     ('sharmarajdaksh'),
--     ('dexs'),
--     ('dakshraj.sharma');

-- INSERT INTO photos (image_url, user_id)
-- VALUES
--     ('/alskjd7', 1),
--     ('/lajsk98', 2),
--     ('/saud902', 2);

-- INSERT INTO comments (comment_text, user_id, photo_id)
-- VALUES
--     ('Whoa!', 1, 2),
--     ('Amazing Shot!', 3, 2),
--     ('I <3 This', 2, 1);

-- INSERT INTO likes(user_id, photo_id)
-- VALUES
--     (1, 1),
--     (2, 1),
--     (1, 2),
--     (1, 3),
--     (3, 3);
    
-- INSERT INTO follows(follower_id, followee_id)
-- VALUES
--     (1, 2),
--     (1, 3),
--     (3, 1),
--     (2, 3);
    
-- INSERT INTO tags(tag_name)
-- VALUES
--     ('adorable'),
--     ('cute'),
--     ('sunrise');
    
-- INSERT INTO photo_tags (photo_id, tag_id)
-- VALUES
--     (1, 1),
--     (1, 2),
--     (2, 3),
--     (3, 2);
