# Music Player App

A Flutter-based music player application that allows users to select directories to scan for audio files, organizes them by songs, artists, and albums, and provides playback functionality with basic controls. The app uses the BLoC pattern for state management and follows clean architecture principles for a scalable and maintainable codebase.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Directory Selection**: Users can select specific directories to scan for audio files using a directory picker (e.g., `file_picker`).
- **Permission Handling**: Requests necessary permissions (e.g., storage access on Android) to read files from selected directories.
- **Audio Scanning**: Scans the selected directories for audio files with supported extensions (e.g., `.mp3`, `.wav`, `.aac`).
- **Metadata Extraction**: Extracts metadata from audio files, including title, artist, album, and album art, using `dart_tags`.
- **Local Database**: Stores audio file details in a local database (`sqflite`) for offline access and fast retrieval.
- **Audio List Display**: Presents audio files in a tabbed interface with three tabs: "Songs", "Artists", and "Albums".
- **Search Functionality**: Allows users to search for songs, artists, or albums by typing keywords, with real-time filtering.
- **Playback**: Plays selected audio files using `just_audio`, supporting common audio formats.
- **Playback Controls**: Includes controls like play, pause, stop, next, previous, and seek (via a slider).
- **Playback Queue**: Maintains a queue of songs and automatically plays the next song when the current one finishes.
- **Background Playback**: Configured to enable playback when the app is in the background.
- **UI Components**: Features a persistent mini player and a full player screen with detailed controls and metadata.
- **Error Handling**: Gracefully handles errors such as permission denials, missing files, or playback failures.
- **Performance**: Optimized for large music libraries using efficient database queries and lazy loading in the UI.

## Architecture

The app follows clean architecture principles, divided into three layers:

- **Domain Layer**: Contains business logic, entities (e.g., `AudioFile`), repositories (e.g., `AudioRepository`), and use cases (e.g., `GetAudioFilesUseCase`).
- **Data Layer**: Implements repositories and manages data sources, including file scanning, metadata extraction, database operations, and audio playback.
- **Presentation Layer**: Manages the UI and state using the BLoC pattern, including screens (e.g., `AudioListScreen`), widgets (e.g., `MiniPlayer`), and BLoCs (e.g., `AudioPlayerBloc`).

This architecture ensures separation of concerns, making the codebase modular, testable, and easy to maintain.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/music_player.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd music_player
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the app**:
   ```bash
   flutter run
   ```

Ensure you have Flutter installed on your machine. For more information, visit the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

## Usage

1. **Select Directories**:
   - Navigate to the settings screen.
   - Use the directory selector to choose folders containing your audio files.
   - The app will scan these directories and update the database with the found audio files.

2. **Browse Audio Files**:
   - Use the tabbed interface to view your music library by "Songs", "Artists", or "Albums".
   - Tap on an artist or album to see a filtered list of songs.

3. **Search**:
   - Use the search bar in the audio list screen to find specific songs, artists, or albums.
   - Results update in real-time as you type.

4. **Play Music**:
   - Tap on a song to start playback.
   - Use the mini player at the bottom to control playback without leaving the list.
   - Expand the mini player to access the full player screen for detailed controls and metadata.

5. **Manage Settings**:
   - Access the settings screen to manage selected directories or trigger a manual rescan.

## Dependencies

The app uses the following dependencies:

- `flutter_bloc: ^8.1.1` - For state management.
- `just_audio: ^0.9.34` - For audio playback.
- `file_picker: ^5.2.0` - For directory selection.
- `permission_handler: ^10.2.0` - For handling permissions.
- `shared_preferences: ^2.0.15` - For persisting selected directories.
- `sqflite: ^2.0.2` - For local database storage.
- `dart_tags: ^0.3.2` - For metadata extraction.
- `get_it: ^7.2.0` - For dependency injection.

To install these dependencies, run:
```bash
flutter pub get
```

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with descriptive messages.
4. Push your changes to your fork.
5. Submit a pull request to the main repository.

Please ensure your code follows the project's coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Notes:
- **Screenshots**: You can enhance the README by adding screenshots of the app in action. Place them in a `screenshots/` directory and reference them in the README using Markdown image syntax (e.g., `![Screenshot](screenshots/screenshot1.png)`).
- **Project Link**: Replace `https://github.com/yourusername/music_player.git` with the actual repository URL.
- **Customization**: Feel free to add sections like "Known Issues," "Future Enhancements," or "Credits" as the project evolves.