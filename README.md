
# 📘 Library Lending System (SQLite Project)

This is an intermediate-level SQL-only project designed to simulate a public library system. It uses SQLite and contains multiple tables representing books, members, borrowings, and fines.

## 🗂️ Schema Overview

- **Authors**: author_id, name, country
- **Books**: book_id, title, author_id, genre, published_year
- **Members**: member_id, name, email, membership_date
- **Borrowings**: borrowing_id, book_id, member_id, borrow_date, return_date
- **Fines**: fine_id, borrowing_id, amount, paid

## 📊 Sample Use Cases

- Top 5 most borrowed books
- Members with highest fines
- Most active members
- Overdue book tracking (via a View)
- Book popularity ranking (via window function)

## 📁 Files Included

- `library_system.sqlite`: The SQLite database file
- `library_system.sql`: SQL script for schema creation
- `queries.sql`: Collection of useful SQL queries
- `README.md`: Project overview and documentation

> You can explore this project using DB Browser for SQLite or any compatible SQLite GUI.

---

Created for educational purposes. Feel free to fork, modify, and use in your portfolio.
