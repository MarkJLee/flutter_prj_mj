# Mood Journal

> Mood Tracker

## Goal

Develop a mood tracker application utilizing Flutter. Implement Firebase Authentication and Firestore for backend services, leverage Riverpod for state management, utilize GoRouter for navigation, and adopt the MVVM architectural pattern.

## Requirements

### Sign Up and Sign In

1. "The SignUp and SignIn widgets must incorporate a Form with two TextFormField widgets for email and password input."

2. "Upon user registration, a new account should be instantiated within Firebase, and the user should be authenticated using Firebase Authentication."

3. "Upon user authentication through SignIn, they should be navigated to the HomeScreen via Firebase Authentication."

### Home Screen

1. "The `HomeScreen` should incorporate a `BottomNavigationBar` with two `BottomNavigationBarItem`s: 'Home' and 'Post'."
2. "Navigating to the 'Post' tab should route the user to the `PostScreen`."
3. "Navigating to the 'Home' tab should route the user back to the `HomeScreen`."
4. "Mood entries should be retrieved from Firestore."
5. "A mood entry should consist of a date, a mood (emoji), and a description."
6. "On long pressing a mood entry, an `AlertDialog` should be displayed, prompting the user for deletion."
7. "Upon confirming 'Delete', the mood entry should be removed from Firestore."

### Post Screen

1. "The `PostScreen` should contain a `Form` widget with a `TextField` for entering the mood entry description."

2. "Below the input, a row of emoji buttons should be displayed."

3. "Upon pressing the 'Post' button, a mood entry should be instantiated in Firestore, and the user should be routed to the `HomeScreen` where the new entry is visible."

## Demo

[https://imgur.com/1znFSO1]
