import 'package:dio/dio.dart';

class LoginService {
  final Dio dio;

  LoginService() : dio = Dio();

  Future<Response> postData(String email, String password) async {
    try {
      final response = await dio.post(
        'http://192.168.101.96:8889/api/auth/login',
        data: {'emailOrPhone': email, 'password': password},
      );

      return response;
    } catch (e) {
      rethrow; 
    }
  }
}
