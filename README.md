# Event Management System 📱 + 💻

A full-stack cross-platform solution designed to handle event scheduling, booking, and management. This project demonstrates a unified ecosystem where a mobile app (Flutter) and a web platform (Django) communicate via a shared backend.

## 🚀 Project Overview

This system bridges the gap between mobile users and web administrators.
* **Mobile App (Flutter):** Allows users to browse events, book tickets, and view their schedules on Android/iOS.
* **Web Portal (Django):** Serves as the admin panel and public website for event organizers to create events, manage bookings, and view analytics.

## 🛠️ Tech Stack

**Mobile Application:**
* **Framework:** Flutter (Dart)
* **Architecture:** MVC / Provider 
* **Platform:** Android & iOS

**Backend & Web:**
* **Framework:** Django (Python)
* **Database:** SQLite (Default)
* **Template Engine:** Django Templates (HTML/CSS)

## 📂 Project Structure

The repository is divided into two main modules:

### 1. Mobile App (`/lib`)
Built with Flutter, this module handles the client-side experience.
* `lib/`: Contains all Dart source code for UI and logic.
* `assets/`: Stores static images and icons.

### 2. Web Backend (`/EVENTMNGMNT` & `/myapp`)
Built with Django, this module acts as the server and web interface.
* `EVENTMNGMNT/`: Main Django project configuration and settings.
* `myapp/`: The core application logic handling views and models.
* `templates/`: HTML files for the web interface.
* `media/`: Storage for user-uploaded content.

## ✨ Key Features
* **Cross-Platform Sync:** Data is synchronized between the mobile app and website.
* **Event Listing:** Dynamic retrieval of events from the database.
* **User Management:** Registration and authentication system.
* **Responsive Web Design:** The web module is accessible on desktop and mobile browsers.

## 📸 Screenshots
<img width="436" height="788" alt="image" src="https://github.com/user-attachments/assets/42de1856-d233-436b-bdfb-d21a9dc694fe" />


---
*Created by Yahyavk*
