// core/constants/constants.dart
class Constants {
  Constants._();

  // API
  static const String baseUrl = 'https://api.thecatapi.com/v1/';
  static const String breedsEndpoint = 'breeds';

  // Config
  static const bool isDebugMode = true; // Change in release mode
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
}