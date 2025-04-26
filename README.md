# 📚 Student Attendance App 📱

A simple and clean **Student Attendance Management** application built with **Flutter** and **Firebase Firestore**. This app allows users to **add students, view a real-time list, mark attendance (P/A), update attendance status visually, and delete student records** — all synced with Firebase in real-time.

---

## 📸 Screenshots

| Home Screen | Add Student |
|:------------|:------------|
| ![Home](![image](https://github.com/user-attachments/assets/d05403f0-9f50-4313-b225-5b8b07376106)| ![Add](![image](https://github.com/user-attachments/assets/b03472c8-12cf-41b6-9f19-3063f4780e85) |


---

## 🚀 Features

- 🔥 **Firebase Firestore Integration**
- 📖 Add new students (Name, Roll No, Age)
- 📋 View students in a real-time list
- ✅ Mark attendance as **Present (P)** or **Absent (A)**
- 🎨 Visual indicator for attendance status:
  - Green = Present
  - Red = Absent
- 📝 Delete student records
- 📱 Responsive and clean UI
- ⚙️ Real-time updates via `StreamBuilder`

---

## 📦 Tech Stack

- **Flutter**
- **Dart**
- **Firebase Firestore**
- **Firebase Core**

---

## 📂 Project Structure
lib/ 
┣ main.dart 
┣ models/ ┃  student.dart 
┣ screens/ ┃ home_screen.dart |  add_student_screen.dart


---

## 🔧 Setup Instructions

1. 🔥 Create a project on [Firebase Console](https://console.firebase.google.com/)
2. Add your Android/iOS app
3. Download `google-services.json` and place it inside `android/app/`
4. Update your `android/build.gradle` and `android/app/build.gradle` as per Firebase setup guide
5. Run:
   ```bash
   flutter pub get
   flutter run



---
in firebase Make sure your Firestore rules (for testing) are:
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}


