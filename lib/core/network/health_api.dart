import 'package:dio/dio.dart';

class HealthApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));
  // Use 10.0.2.2 for Android emulator. For iOS simulator/macOS, use http://localhost:8000.

  Future<String> health() async {
    final res = await _dio.get('/health');
    return res.data.toString();
  }
}