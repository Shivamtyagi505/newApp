import 'package:flutter/material.dart';
import 'package:news_app/constants/color_constants.dart';

import '../../service/google_signIn_service.dart';
import '../home_page.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  void login(BuildContext context) async {
    bool isSuccess = await GoogleSigninService().signIn();
    if (isSuccess) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to Google SignIn!!"),
        duration: Duration(milliseconds: 300),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(color: AppColors.burgundy, borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/flashNews.jpg'),
                  ),
                  const SizedBox(height: 80),
                  OutlinedButton.icon(
                      onPressed: () => login(context),
                      icon: Image.asset('assets/google.png', height: 40),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text('LogIn with Google'),
                      )),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                      onPressed: () => login(context),
                      icon: Image.asset('assets/google.png', height: 40),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text('SignUp with Google'),
                      )),
                ],
              ),
            )));
  }
}
