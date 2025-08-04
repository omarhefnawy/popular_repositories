## Popular GitHub Repositories App

A simple Flutter application that allows users to browse the most popular GitHub repositories based on filters such as creation date, programming language, and result limit.

## Features

- Filter repositories by:
  - Creation date
  - Programming language (Dart, JavaScript, Python, Java, C++, etc.)
  - Number of results (10, 50, 100)
- Display repository details including:
  - Repository name
  - Star count
  - Programming language
  - Creation date
  - Owner's avatar

## Architecture

This project follows the MVC (Model - View - Controller) architecture:

- **Model**: Defines the structure of the repository data.
- **View**: UI components built with Flutter widgets.
- **Controller (Cubit)**: Manages state and communicates with the API services.

## Tech Stack

- Flutter
- Dart
- Dio (HTTP client)
- Flutter Bloc (State Management)
- GetIt (Dependency Injection)
- Intl (Date formatting)
- GitHub REST API

## Folder Structure

- controllers  
- core  
- model  
- service  
- view  

## Author

Developed by **Omar Hefnawy**
