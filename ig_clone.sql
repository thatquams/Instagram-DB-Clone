-- Create Instagram DB
DROP DATABASE IF EXISTS Ig_Clone;
CREATE DATABASE Ig_Clone;
-- Activate DB
USE Ig_Clone;

-- Create Users Table
CREATE TABLE Users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );
  
-- Create Photos Table
CREATE TABLE Photos(
	photo_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
    );
    
-- Create Comments Table
CREATE TABLE Comments(
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id)
    );
    
-- Create Likes Table
CREATE TABLE Likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id)
    );
  
-- Create FOllowers Table
CREATE TABLE Follows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES Users(user_id),
	FOREIGN KEY(followee_id) REFERENCES Users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

-- Create Tags Table
CREATE TABLE tags (
  tag_id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create Photo Tags Table
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(tag_id) REFERENCES tags(tag_id),
    PRIMARY KEY(photo_id, tag_id)
);
