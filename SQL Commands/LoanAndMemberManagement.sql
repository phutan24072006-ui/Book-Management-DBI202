﻿----------------- Quản lý Mượn sách & Thành viên ---------------

-- 1. Liệt kê tên thành viên và địa chỉ của tất cả thành viên ở 'Asgard' hoặc 'London'.
SELECT name, address
FROM Member
WHERE address IN ('Asgard', 'London');

-- 2. Cho biết mã đơn mượn (loan_id) và tên thành viên của những người mượn sách trong khoảng thời gian từ '2026-01-20' đến '2026-01-31'.
SELECT l.loan_id, m.name
FROM Loan l
JOIN Member m ON l.member_id = m.member_id
WHERE l.loan_date BETWEEN '2026-01-20' AND '2026-01-31';

-- 3. Mỗi thủ thư (tên thủ thư) đã xử lý bao nhiêu đơn mượn sách (loan)?
SELECT lib.librarian_name AS librarian_name, COUNT(l.loan_id) AS total_processed_loans
FROM Librarian lib
LEFT JOIN Loan l ON lib.librarian_id = l.librarian_id
GROUP BY lib.librarian_id, lib.librarian_name;

-- 4. Tìm tên các thành viên đã mượn sách và sử dụng chính sách 'POL2'.
SELECT DISTINCT m.name
FROM Member m
JOIN Loan l ON m.member_id = l.member_id
WHERE l.policy_id = 'POL2';

-- 5. Liệt kê danh sách các thành viên chưa từng thực hiện lượt mượn nào.
SELECT m.*
FROM Member m
LEFT JOIN Loan l ON m.member_id = l.member_id
WHERE l.loan_id IS NULL;

-- 6. Cho biết tên thành viên và ngày mượn của những người mượn sách do thủ thư 'Sarah Connor' (L01) xử lý.
SELECT m.name, l.loan_date
FROM Loan l
JOIN Member m ON l.member_id = m.member_id
JOIN Librarian lib ON l.librarian_id = lib.librarian_id
WHERE lib.librarian_id = 'L01';
