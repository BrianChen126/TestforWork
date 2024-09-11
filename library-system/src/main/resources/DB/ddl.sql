
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    phone_number VARCHAR(10) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    registration_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login_time DATETIME
);

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    store_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    book_status ENUM('在庫', '出借中', '整理中', '遺失', '損毀', '廢棄') DEFAULT '在庫'
);

CREATE TABLE Book (
    isbn VARCHAR(20) PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    introduction TEXT
);

CREATE TABLE Borrowing_Record (
    user_id INT,
    inventory_id INT,
    borrowing_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_time DATETIME,
    PRIMARY KEY (user_id, inventory_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);