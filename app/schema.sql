DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE projects (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  repo TEXT NOT NULL,
  tags TEXT,
  web TEXT,
  FOREIGN KEY (author_id) REFERENCES users (id)
);

-- Just for check that functionality works, this need to be deleted !! --
INSERT INTO users (username, password, email)
VALUES
  ('admin', 'admin', 'admin@testing.com');

INSERT INTO projects (title, body, author_id, created, repo, tags, web)
VALUES
  ('test title', 'test body description', 1, '2020-01-01 00:00:00', 'test_repo@github.com', 'python, sql', 'www.google.com'),
  ('other title', 'other body description', 1, '2020-01-02 00:00:00', 'other_repo@github.com', 'python, aws', ''),
   ('other title', 'other body description', 1, '2020-01-02 00:00:00', 'other_repo@github.com', 'python, aws', ''),
    ('other title', 'other body description', 1, '2020-01-02 00:00:00', 'other_repo@github.com', 'python, aws', ''),
     ('other title', 'other body description', 1, '2020-01-02 00:00:00', 'other_repo@github.com', 'python, aws', '');