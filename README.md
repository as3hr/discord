
# Flutter WebRTC & Chat Application ( IN DEVELOPMENT )

A powerful and modern Flutter-based mobile application with a Node.js backend, featuring WebRTC for audio and video calling, real-time chat, server/channel creation, and more. Built using clean architecture principles and Bloc/Cubit for state management.

## Features

- **Audio/Video Calling** via WebRTC:
  - One-to-one calls
  - Group calls within channels
- **Real-time Chat**: 
  - Text messaging in private or group channels
- **Server & Channel Creation**: 
  - Users can create and join servers or channels
- **Clean UI**: 
  - Smooth animations enhancing the user experience
- **State Management**: 
  - Clean architecture with Bloc-Cubit implementation
- **CRUD Operations**: 
  - User profile management, settings configuration
- **Friends System**:
  - Sending and accepting friend requests
- **Dynamic Links**: 
  - Powered by Firebase, for inviting friends via deep links
- **Push Notifications**: 
  - Handled by Firebase for message and call notifications

## Tech Stack

- **Frontend**: Flutter (Mobile)
  - Clean architecture
  - Bloc-Cubit state management
  - WebRTC for audio/video calls
  - Dynamic links and push notifications using Firebase
- **Backend**: Node.js
  - REST API for CRUD operations
  - WebRTC signaling for audio/video communication
  - WebSockets for real-time chat

## Installation

### Backend (Node.js)

1. Clone the repository:
    ```bash
    git clone https://github.com/as3hr/discord
    ```
2. Install dependencies:
    ```bash
    cd backend
    npm install
    ```
3. Start the server:
    ```bash
    npm run dev
    ```

### Frontend (Flutter)

1. Clone the Flutter mobile application repository:
    ```bash
    git clone https://github.com/as3hr/discord/
    ```
2. Install dependencies:
    ```bash
    cd mobile-app
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```

## Usage

1. Users can register/login using the mobile app.
2. After logging in, users can create or join servers and channels.
3. Start one-to-one or group audio/video calls using WebRTC.
4. Enjoy real-time chat with friends and in channels.
5. Send and accept friend requests to build connections.
6. Notifications are received for calls, messages, and friend requests via Firebase.

## Contributing

Feel free to open an issue or submit a pull request for improvements and bug fixes.

## License

This project is licensed under the MIT License.

---
Developed by Muhammad Ashar - 2024
