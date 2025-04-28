
-- 1. Top 5 most borrowed books
SELECT b.title, COUNT(*) AS borrow_count
FROM Borrowings br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

-- 2. Members with the highest total fines
SELECT m.name, SUM(f.amount) AS total_fines
FROM Fines f
JOIN Borrowings br ON f.borrowing_id = br.borrowing_id
JOIN Members m ON br.member_id = m.member_id
GROUP BY m.name
ORDER BY total_fines DESC;

-- 3. Most active members by number of borrowings
SELECT m.name, COUNT(*) AS borrow_count
FROM Borrowings br
JOIN Members m ON br.member_id = m.member_id
GROUP BY m.name
ORDER BY borrow_count DESC
LIMIT 5;

-- 4. View: Overdue books (assuming 14-day borrowing window)
CREATE VIEW OverdueBooks AS
SELECT br.borrowing_id, b.title, m.name, br.borrow_date
FROM Borrowings br
JOIN Books b ON br.book_id = b.book_id
JOIN Members m ON br.member_id = m.member_id
WHERE br.return_date IS NULL AND DATE('now') > DATE(br.borrow_date, '+14 day');

-- 5. Rank books by popularity (window function)
SELECT title, borrow_count,
       RANK() OVER (ORDER BY borrow_count DESC) AS rank
FROM (
    SELECT b.title, COUNT(*) AS borrow_count
    FROM Borrowings br
    JOIN Books b ON br.book_id = b.book_id
    GROUP BY b.title
);
