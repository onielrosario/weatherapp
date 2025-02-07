# WeatherApp

A simple SwiftUI application demonstrating how to fetch and display current weather data from [WeatherAPI](https://www.weatherapi.com/) (including icons, temperature, humidity, UV index, etc.). The user can search for a city, see current conditions, and persist their selection for the next app launch.

## Table of Contents

1. [Features](#features)  
2. [Architecture](#architecture)  
3. [Requirements](#requirements)  
4. [Installation](#installation)  
5. [Usage](#usage)  
6. [Roadmap / TODO](#roadmap--todo)  
7. [Contact](#contact)

---

## Features

- **City Search**: Type a city name to look up weather data.  
- **Current Weather**: Displays temperature, feels-like, humidity, UV index, and a weather icon.  
- **Persistence**: Saves the last-searched city using `UserDefaults` so it auto-loads on the next launch.  
- **Error Handling**: Shows an error message for invalid cities or network issues.  
- **Debounced Search**: Prevents unnecessary API calls while the user is typing (optional).

---

## Architecture

- **MVVM**:  
  - **Model**: Plain Swift structs for `WeatherInfo` and `WeatherResponseDTO`.  
  - **View**: SwiftUI views (`HomeView`, `SearchView`, `CityCardView`, `SearchBarView`, `DetailComponentView`).  
  - **ViewModel**: (`HomeViewModel`), responsible for fetching and storing state.  
- **Data Layer**:  
  - **`WeatherAPIClient`** makes the actual HTTP requests using `async/await`.  
  - **`WeatherRepository`** merges or caches results and maps DTO → domain model.  
- **Persistence**:  
  - `UserDefaults` to store the last-searched city name.

Directory structure (example):
```
WeatherApp/
├── Local Storage
    ├── CityStorage.swift
├── Weather API
│   ├── WeatherAPIClient.swift
│   └── WeatherRepository.swift
│   ├── WeatherInfo.swift
│   └── WeatherResponseDTO.swift
├── App
|   ├── Weather_App.swift
├── Resources
|   ├── Fonts
|   |   ├── Poppins
|   |   |   ├── Poppins-Bold.ttf
|   |   |   ├── Poppins-Medium.ttf
|   |   |   ├── Poppins-Regular.ttf
|   ├── Assets.xcassets
|   ├── Weather-App-Info.plist
│   ├── ViewModels
│   │   ├── HomeViewModel.swift
│   │   └── SearchViewModel.swift
├── Presentation
│   └── Components
|       ├── SearchBarView.swift
│       ├── DetailComponentView.swift
│       ├── CityCardView.swift
|   ├── Home
│       ├── HomeView.swift
│       ├── HomeViewModel.swift
│   ├── Search
│       ├── SearchView.swift
└── README.md
```

---

## Requirements

- **Xcode 14** or later (works with Swift 5.7+).
- **iOS 15** or later deployment target (can be tweaked as needed).
- **WeatherAPI** account (free tier) with an **API key**.

---

## Installation

1. **Clone** or **Download** this repository:
   ```bash
   git clone https://github.com/onielrosario/weatherapp.git
   ```
2. **Open** `WeatherApp.xcodeproj` in Xcode.
3. **Configure** your WeatherAPI key:
   - In `Weather_App.swift`, replace `YOUR_API_KEY_HERE` with your actual key. or

4. **Build and Run** on an iOS Simulator or a physical device.

---

## Usage

1. **Launch** the app.
2. If no city is saved, you’ll see the “No City Selected” message.  
3. **Search** for a city (e.g., “San Francisco”). Debounce logic (if implemented) prevents multiple rapid queries.  
4. **Tap** on the resulting city card or let the app display the weather automatically.  
5. The **home screen** shows the current weather details.  
6. On **subsequent launches**, the last searched city is automatically loaded from storage (if selected or tapped).

---

## Roadmap / TODO

- **Additional Forecast**: Show extended forecast for the next few days.  
- **UI/UX Enhancements**: Animations, custom icons, better layout, Darkmode style.  
- **Localization**: Support multiple languages.  
- **Unit Tests**: Expand coverage for ViewModels and Repository.  
- **Offline Support**: Cache the most recent weather data for offline viewing.

---

## Contact

Created by **Oniel Rosario** – [@checkyourpm](https://x.com/checkyourpm) – [orose2689@gmail.com](mailto:orose2689@gmail.com)

If you have any questions or feedback, feel free to reach out!

---

*Thank you for checking out WeatherApp! Enjoy exploring the project.*
