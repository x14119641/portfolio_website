INSERT INTO users (username, password, email)
VALUES
  ('test', 'pbkdf2:sha256:50000$TCI4fzcX$0d7171a4f7dac32e3364c7ddc7c14f3e2fa61f2d12573383f7ffbb431b4acb2f', 'test@testing.com'),
  ('other', 'pbkdf2:sha256:50000$kJPKaz6N$d2d4784d5h830a9761f5ccaeeaca413f27f2ecb76d6168407af962ddce849f79', 'other@testing.com');

INSERT INTO projects (title, body, author_id, created, repo, tags, web)
VALUES
  ('test title', 'test body description', 1, '2020-01-01 00:00:00', 'test_repo@github.com', 'python, sql', 'No web'),
  ('other title', 'other body description', 2, '2020-01-02 00:00:00', 'other_repo@github.com', 'python, aws', '');