import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
static  final apiKey = dotenv.env['API_KEY'];
static final baseUrl = dotenv.env['BASE_URL'];
  static const String breedsEndpoint = 'breeds';
  static const String favoritesEndpoint = 'favourites';
  static const String searchEndpoint = 'breeds/search';
  static const bool isDebugMode = true; 
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
}