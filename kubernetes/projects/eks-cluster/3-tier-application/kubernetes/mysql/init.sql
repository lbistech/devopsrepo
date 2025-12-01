-- Create database
CREATE DATABASE IF NOT EXISTS appdb;

-- Use the database
USE appdb;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO users (name, email) VALUES
  ('Alice Johnson', 'alice.johnson@example.com'),
  ('Bob Smith', 'bob.smith@example.com'),
  ('Charlie Brown', 'charlie.brown@example.com'),
  ('Diana Prince', 'diana.prince@example.com'),
  ('Edward Norton', 'edward.norton@example.com'),
  ('Fiona Apple', 'fiona.apple@example.com'),
  ('George Wilson', 'george.wilson@example.com'),
  ('Hannah Montana', 'hannah.montana@example.com'),
  ('Ian McKellen', 'ian.mckellen@example.com'),
  ('Julia Roberts', 'julia.roberts@example.com');
