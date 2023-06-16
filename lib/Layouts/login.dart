import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:spo_act/Layouts/landing_page.dart';
import 'package:spo_act/services/login_service.dart';

final dio = Dio();
final loginService = LoginService();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  late String email;
  late String password;

  void handleOnChange(String value) {
    setState(() {
      email = value;
    });
  }

  void handlePassword(String value) {
    setState(() {
      password = value;
    });
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => const Login(),
      ),
    );
  }

  Future<void> postData(String email, String password) async {
    try {
      // final response = await dio.post(
      //   'http://192.168.101.96:8889/api/auth/login',
      //   data: {'emailOrPhone': email, 'password': password},
      // );

      final response = await loginService.postData(email, password);

      if (response.statusCode == 200 && context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (builder) => const LandingPage(),
          ),
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage = errorResponse['message'];
        print('Error: $errorMessage');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage['error']),
            backgroundColor: const Color(0xFFFF0000),
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {
                // Code to execute.
              },
            ),
          ),
        );
      } else {
        print('Error: $e');
      }
    }
  }

  void handleOnPressed() {
    postData(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(
          0xFF056333,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            color: const Color(
              0xFF056333,
            ),
            child: const Text(
              'Sign in to your Account',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 380,
            child: Column(
              children: [
                TextField(
                  onChanged: handleOnChange,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFFC4C4C4,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFF056333,
                        ),
                      ),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(
                        0xFFC4C4C4,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: handlePassword,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: const Color(0xFF056333),
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFFC4C4C4,
                        ),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(
                          0xFF056333,
                        ),
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color(
                        0xFFC4C4C4,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 380,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: handleOnPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(
                          0xFF056333,
                        ),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
