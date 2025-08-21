
# Task App

A **Flutter e-commerce app** built with provider state management, supporting network images, screen responsiveness, and modular folder structure.

---

## 📦 Folder Structure

```
 lib
    ├── config
    │   ├── api_endpoint.dart
    │   └── api_exception.dart
    ├── const
    │   ├── app_strings.dart
    │   ├── color.dart
    │   └── images.dart
    ├── main.dart
    ├── model
    │   ├── category_model.dart
    │   └── product_model.dart
    ├── routing
    │   ├── routing.dart
    │   └── routing_name.dart
    ├── services
    │   ├── api_services.dart
    │   ├── base_api.dart
    │   └── splash_services.dart
    ├── uitls
    │   ├── custom_text.dart
    │   └── sizebox_extension.dart
    └── view
    │   ├── category_screen
    │       ├── category_provider.dart
    │       ├── catrgory_screen.dart
    │       └── widget
    │       │   └── error_widget.dart
    │   ├── favourites_screen
    │       ├── favorites_provider.dart
    │       └── favorites_screen.dart
    │   ├── main_screen
    │       ├── main_provider.dart
    │       └── main_screen.dart
    │   ├── product_details
    │       └── product_details.dart
    │   ├── product_screen
    │       ├── product_provider.dart
    │       ├── product_screen.dart
    │       └── widget
    │       │   └── product_card.dart
    │   ├── splash_screen
    │       ├── splash_provider.dart
    │       └── splash_screen.dart
    │   └── user_name
    │       └── user_name.dart
````

---

## 🛠 Dependencies

- **Flutter SDK:** ^3.7.2  
- **Provider:** ^6.1.5+1 → State management  
- **HTTP:** ^1.5.0 → API requests  
- **Cached Network Image:** ^3.4.1 → Efficient image loading & caching  
- **Flutter ScreenUtil:** ^5.9.3 → Responsive UI and adaptive sizing  
- **Cupertino Icons:** ^1.0.8 → iOS-style icons  

---

## ⚡ Features

- Splash screen with provider-based initialization  
- Modular folder structure for maintainability  
- Network API integration for fetching categories and products  
- Favorites management with persistent storage (SharedPreferences)  
- Responsive UI for different screen sizes (ScreenUtil)  
- Hero animations for smooth product transitions  
- Search functionality with live filtering  
- Error handling and retry for API calls  

---

## 🧩 Folder Overview

### **config/**  
- Store app-wide configurations, API endpoints, and environment variables.  

### **const/**  
- Constants such as colors, strings, and asset paths.  
- Example: `AppStrings`, `AppColors`, `AppImages`.  

### **model/**  
- Dart classes representing your data structures.  
- Example: `ProductModel`, `CategoryModel`.  

### **routing/**  
- Centralized navigation using named routes.  
- Example: `RoutesName.dart`.  

### **services/**  
- Handles API requests and other services.  
- Example: `ApiService.dart`, `SplashServices.dart`.  

### **utils/**  
- Reusable widgets, extensions, and helper functions.  
- Example: `CustomText`, `SizeBoxExtensions`.  

### **view/**  
- UI screens organized by feature:  
  - `splash_screen/`  
  - `product_screen/`  
  - `favorites_screen/`  
  - `category_screen/`  

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/afaqxdev/E-commerce
cd task_app
````

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

> Make sure your device/emulator is connected.

---

## 📌 Notes

* Make sure to **add your API endpoints** in `config/api_endpoint.dart`.
* Use **provider** to manage state across your app for categories, products, and favorites.
* Assets must be placed under `assets/` folder and declared in `pubspec.yaml`.

---


