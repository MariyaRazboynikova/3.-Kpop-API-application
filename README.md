# K-Pop fan app

## Overview

This application is a Flutter-based K-Pop fan app designed to provide users with information about female K-Pop groups and idols. It features a dynamic theme toggle between light and dark modes, an API service to fetch data about various female K-Pop groups, and a user-friendly interface for browsing and searching through idol profiles.

## Features

- **Dynamic Theme Switching**: Users can toggle between light and dark themes easily using a switch in the app bar. The application uses the `ThemesProvider` class to manage theme states and notify listeners of changes.

- **Data Fetching**: The app utilizes the `ApiService` class to retrieve data from a public API that provides information about female K-Pop groups. This includes details such as group names, agency names, member lists, and debut dates.

- **Group and Idol Models**: The application defines several models, including `Group`, `Idol`, and their respective entities to structure the data effectively. These models handle JSON serialization and deserialization, making it easy to convert data from the API into usable Dart objects.

- **Bloc State Management**: The app employs the BLoC (Business Logic Component) pattern to manage state efficiently. It includes classes for events and states related to group fetching, ensuring a responsive UI that reflects loading states and errors.

- **Search Functionality**: Users can search for groups by name using a text field that filters results in real-time as they type. This enhances user experience by allowing quick access to specific female groups.

- **Detailed Idol Profiles**: When a user selects a group, they can view detailed profiles of the idols within that group. Each profile displays essential information such as name, real name, birth date, height, weight, and debut date.

### User Interface

The user interface is designed with simplicity and usability in mind:

- **Intro Page**: A welcoming screen that introduces users to the app's purpose.

- **Groups Page**: Displays a list of female K-Pop groups sorted alphabetically. Each group entry shows its name and agency name, with an optional thumbnail image.

- **Members Page**: This page provides detailed information about the selected group, including:
    - **Agency Name**: Displays the name of the agency managing the group.
    - **Debut Date**: Shows the date when the group debuted.
    - **Members List**: Lists all members of the selected group along with their roles, if specified. Each member's role is displayed clearly, enhancing the user's understanding of each idol's position within the group.
  
- **Idol Details Page**: When an idol is selected from a group, users are taken to a detailed view where they can see information about the idol.


