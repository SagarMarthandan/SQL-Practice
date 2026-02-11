# SQL Practice and Revision

This repository contains a collection of SQL scripts used for practicing and revising various database concepts, ranging from basic string manipulation to advanced data warehousing techniques.

## Files Overview

### 1. Basic Data & String Functions
*   **[book_data.sql](book_data.sql)**: Sets up the core `books` table and populates it with initial sample data. This serves as the foundation for many of the practice queries.
*   **7. string_functions.sql**: A comprehensive guide to string manipulation. It covers functions like `CONCAT`, `SUBSTRING`, `REPLACE`, `CHAR_LENGTH`, `TRIM`, and case transformations (`UPPER`/`LOWER`).

### 2. Filtering & Conditional Logic
*   **11. logival_operators.sql**: Focuses on refining data retrieval. It includes practice with:
    *   Comparison operators (`>`, `<`, `!=`).
    *   Logical operators (`AND`, `OR`, `NOT`).
    *   Range and set filters (`BETWEEN`, `IN`).
    *   Conditional logic using `CASE` statements to categorize data on the fly.

### 3. Data Retrieval & Ordering
*   **8. Refining_selections.sql**: Demonstrates various techniques for refining data selection, including:
    *   Ordering results (`ORDER BY` ASC/DESC).
    *   Pattern matching with `LIKE` (including wildcards and escaping).
    *   Limiting the number of results (`LIMIT`).
    *   Selecting distinct values.

### 4. Advanced Querying & Database Objects
*   **15. views_models_more.sql**: Explores more advanced SQL features such as:
    *   Creating and using `VIEWS` for virtual tables.
    *   Aggregating data with `GROUP BY` and `HAVING`.
    *   Using `WITH ROLLUP` for hierarchical summaries.
    *   Inspecting and setting SQL modes.

### 5. Sample Databases (Complex Schemas)
*   **Sakila Database**:
    *   **sakila-mv-schema.sql**: The full schema for the Sakila sample database. It's excellent for practicing complex joins across many tables (films, actors, customers, etc.) and understanding views and triggers.
    *   **sakila-mv-data.sql**: The corresponding data insertion script for the Sakila schema.

### 6. Advanced Data Warehousing (Azure SQL DW)
*   **load-contoso-data-warehouse-to-sql-data-warehouse.sql**: An advanced script demonstrating enterprise-level data loading. Key concepts include:
    *   **PolyBase**: Loading data from Azure Blob Storage.
    *   **External Tables**: Defining metadata for remote data.
    *   **CTAS**: Using `CREATE TABLE AS SELECT` for high-performance data movement.
    *   **Optimization**: Rebuilding columnstore indexes and creating statistics to ensure query performance.

## How to Use
1.  **Setup**: Run the schema scripts first (like `book_data.sql` or `sakila-mv-schema.sql`).
2.  **Practice**: Open the function-specific scripts (String Functions, Logical Operators, Data Retrieval & Ordering, Advanced Querying & Database Objects) to see examples and try writing your own variations.
3.  **Advanced**: Use the Contoso script to understand how SQL scales in a Data Warehouse environment.

---
*Happy Querying!*