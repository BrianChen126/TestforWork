
-- 註冊新使用者
INSERT INTO User (phone_number, user_password, user_name)
VALUES (:phoneNumber, :hashedPassword, :userName);

-- 更新使用者最後登入時間
UPDATE User
SET last_login_time = NOW()
WHERE user_id = :userId;

-- 新增書籍
INSERT INTO Inventory (isbn, store_time, book_status)
VALUES (:isbn, :storeTime, '在庫');

-- 更新書籍狀態
UPDATE Inventory
SET status = :newStatus
WHERE inventory_id = :inventoryId;

-- 新增借閱紀錄
INSERT INTO Borrowing_Record (user_id, inventory_id, borrowing_time)
VALUES (:userId, :inventoryId, NOW());

-- 更新還書時間
UPDATE Borrowing_Record
SET return_time = NOW()
WHERE user_id = :userId AND inventory_id = :inventoryId;

-- 查詢書籍借閱狀態
SELECT i.isbn, i.status, br.user_id, u.user_name
FROM Inventory i
LEFT JOIN Borrowing_Record br ON i.inventory_id = br.inventory_id
LEFT JOIN User u ON br.user_id = u.user_id
WHERE i.isbn = :isbn