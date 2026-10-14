# Simple Flutter Filter App

Just a small practice project to filter a local list of items by multiple criteria (Date, Gender, and Job Type) in Flutter using standard stateful widgets.

## How it works
The app matches data records using three layers of filters:
* Date selection via a date picker
* Radio buttons for gender selection (All, Male, Female)
* Checkboxes for job types (Full-Time or Part-Time)

The main logic loops through the dummy data array inside `HomePage.dart` and uses a basic `setState` block to refresh the visible list on screen.

## Project Structure
* `main.dart` - App launcher and main setup
* `HomePage.dart` - Main state, filter UI elements, and search logic
* `models/` - Blueprint data structures
* `widgets/` - Custom components for the date picker and list rows

## Run it locally
1. Get packages: `flutter pub get`
2. Run on device: `flutter run`

Requires the `intl` package for formatting dates.
