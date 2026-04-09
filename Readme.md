# PlatinumRx Assignment

## Overview

This assignment demonstrates problem-solving using SQL, Spreadsheet (Excel), and Python based on the given schemas and requirements.

---

## SQL Approach

* Created tables and inserted sample data based on the given schema (Hotel & Clinic systems).
* Used **JOINs** to combine multiple tables where required.
* Used **GROUP BY + SUM()** to calculate totals like billing amount and revenue.
* Applied **WHERE conditions** to filter data by month/year.
* Used **subqueries** to find:

  * Last booked room per user
  * Most/least ordered items
  * Second highest/least values
* Focused on writing **simple and readable queries** without advanced concepts.

---

## Spreadsheet (Excel) Approach

* Created separate sheets: `ticket_data`, `feedbacks_data`, and `analysis`.
* Used **INDEX + MATCH** (instead of XLOOKUP) to populate `ticket_created_at`.
* Created helper columns:

  * `same_day` → check if ticket opened & closed on same day
  * `same_hour` → check if within same hour
* Used **Pivot Tables** to:

  * Count tickets outlet-wise
  * Filter for "Same Day" and "Same Hour"
* Cleaned data by removing blanks and formatting output properly.

---

## Python Approach

* Used basic logic and loops to solve problems.

### 1. Time Conversion

* Converted minutes into hours and remaining minutes using:

  * `//` (division)
  * `%` (remainder)

### 2. Remove Duplicates from String

* Iterated through string using loop

* Built result string by adding only unique characters

* Focused on **simple and beginner-friendly implementation**.

---

## Assumptions

* Sample data was used as given in the documentation.
* Queries and analysis are demonstrated for the year 2021 as per requirements.

---
