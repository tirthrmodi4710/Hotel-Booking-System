# 🏨 Online Hotel Booking System

---

## 📌 Project Overview

The Online Hotel Booking System is a full-stack Java web application that allows users to book hotel rooms, make payments, and manage their bookings seamlessly.

Administrators can manage hotels, rooms, and user bookings through a secure admin panel.

---

## 🛠️ Tech Stack

Backend: Java Servlets, JSP, JDBC  
Frontend: HTML, CSS, Bootstrap, JavaScript  
Database: MySQL  
IDE: Eclipse  
Server: Apache Tomcat  

---

## ✨ Features

### 👤 User Side
- Register and log in to manage bookings securely  
- Search for hotels and view available rooms with pricing and availability  
- Book rooms based on availability and desired dates  
- Make simulated payments for bookings  
- View booking history and payment status  
- Cancel bookings if required  

---

### 🔐 Admin Side
- Secure admin login to manage the system  
- Add, edit, and remove hotels with details  
- Add and manage rooms for each hotel, including room types, prices, and availability  
- View all user bookings and their payment statuses  
- Manage and update booking statuses (e.g., confirmed, cancelled)  

---

## 🖥️ How to Download and Run on Your Local System

Follow these steps to download and run the Online Hotel Booking System locally on your machine:

---

### 1️⃣ Download the Project
Click on the green Code button on this repository.  
Select Download ZIP and extract it on your local system.

---

### 2️⃣ Open in Eclipse
Open Eclipse IDE.  
Go to: File → Import → Existing Projects into Workspace.  
Browse and select the OnlineHotelBookingSystem folder.  
Click Finish to import the project into Eclipse.

---

### 3️⃣ Setup MySQL Database
Open phpMyAdmin or MySQL Workbench.  

Create a new database:

CREATE DATABASE hotel_system;


Import the provided hotel_system.sql file (located in the project) to create required tables and sample data.

---

### 4️⃣ Configure Database Connection
In your project, locate the DBConnection class (or your connection utility class) inside:


src/com/hotel/utils/DBConnection.java


---

### 5️⃣ Configure and Run on Apache Tomcat
Ensure Apache Tomcat is configured in Eclipse:  
Go to Servers → Add New Server → Select Tomcat version.  
Set up your Tomcat installation path.  

Right-click on the OnlineHotelBookingSystem project.  
Select Run As → Run on Server.  

Wait for the server to start.

---

## 🎯 Final Note

Thank you for checking out this Online Hotel Booking System project! I hope it helps you understand building full-stack Java web applications using HTML, CSS, Servlets, JSP, and MySQL.

If you like this project, feel free to ⭐ star the repository and share your feedback. For any issues or suggestions, please open an issue or submit a pull request to improve the project.

Happy Coding! 🚀

---

## 👨‍💻 Author

Tirth R. Modi  
