-- データベースの作成
CREATE DATABASE IF NOT EXISTS mydatabase;

-- myuserに全ての権限を付与
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser' @'%' IDENTIFIED BY 'mypassword';

-- mydatabaseを使用する
USE mydatabase;

-- Circlesテーブルの作成
CREATE TABLE IF NOT EXISTS circles (
    id CHAR(36) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    owner_id CHAR(36) NOT NULL
);

-- Membersテーブルの作成
CREATE TABLE IF NOT EXISTS members (
    id CHAR(36) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    grade INT NOT NULL,
    circle_id CHAR(36),
    age INT NOT NULL DEFAULT 20,
    major VARCHAR(255) NOT NULL DEFAULT 'other',
    FOREIGN KEY (circle_id) REFERENCES circles(id) ON DELETE CASCADE
);