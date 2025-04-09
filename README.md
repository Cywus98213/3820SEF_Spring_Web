# COMP 3820SEF Group Project README

## Project Title: Online Course Website

### Group Members
- **Member 1:** [Cheng Yui Wang] - [13845359]
- **Member 2:** [ZHOU WENHUI] - [13862184]

### Project Description
This project implements a web application for an **Online Course Website** using Jakarta EE, JSP, EL, JSTL, Spring MVC, Spring Boot, and Spring Security. The application is designed to facilitate course materials management, user registration, student-teacher interactions, and polling functionalities.

---

## Basic Features

### Website Hierarchy
- **Index Page:**
    - Displays the course name
    - Lists of lectures
    - Lists of multiple-choice (MC) polls

- **Course Material Page:**
    - Displays the lecture title
    - Provides download links for lecture notes
    - Lists comments from registered users (teachers and students)

- **Poll Page:**
    - Displays a poll question
    - Shows exactly four MC options (with the ability to edit votes)
    - Displays the current number of votes for each MC option
    - Lists comments from registered users (teachers and students)

### User Registration and Login
- **Registration:**
    - Allows new users to register by providing:
        - Username
        - Password
        - Full Name
        - Email Address
        - Phone Number

- **Login Functionality:**
    - Enables registered users to log in to the application.

### Access Control
- **Unregistered Users:**
    - Can access the index page but not other pages.

- **Registered Students:**
    - Can read content on all pages, write comments, vote on polls (with editing capabilities), and update personal information (excluding username).

### Teacher Functionality
- **Teachers:**
    - Can perform all actions available to registered students.
    - Can edit, add, remove, and update the list of admins and users.
    - Can add and delete course material pages and poll pages.
    - Can add and delete course materials and comments.

---

## Additional Features
Groups are required to implement additional features for enhanced functionality:
- (Select features based on your group's decision)
    1. A voting history page for registered users.
    2. A comment history page for registered users.
    3. Batch uploading of multiple files for course materials.
    4. Multiple language support (e.g., English, Traditional Chinese).

---

## Demo Video
A demo video showcasing the functionalities of the web application will be recorded using Zoom. The link to the demo video will be provided in the submission form.

---

## Submission Information
- **Deadline:** April 13, 2025, 23:59
- **Submission Format:** A single zip file containing:
    1. Gradle Web Application
    2. Submission Form
    3. Demo Video

### Submission Form Includes:
- Member list with student IDs.
- Demo video link (e.g., Google Drive or YouTube).
- H2 database details: name, username, and password.
- Usernames and passwords for teacher and student accounts.
- Additional information (e.g., SQL for creating tables and inserting data).

---

## Notes
- The web application will be tested by course instructors for functionality.
- Ensure that the database has sufficient initial data for testing.
- Follow the guidelines for UI and UX to avoid mark deductions.

---

## Contact Information
For any queries regarding the project, please reach out to the group leader:
- **Group Leader Name:** [Name]
- **Email:** [Email Address]
