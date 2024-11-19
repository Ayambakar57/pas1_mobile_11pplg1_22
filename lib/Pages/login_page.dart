import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas1_mobile_11pplg1_22/Controller/login_controller.dart';


class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 188, 121),
      appBar: AppBar(title: Text('Login'),
      backgroundColor: Color.fromARGB(255, 232, 188, 121),
      automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username',
                border:OutlineInputBorder()),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password',
                 border:OutlineInputBorder(),),
                obscureText: true,
              ),
              SizedBox(height: 20),
              _loginController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _loginController.loginUser(
                          _usernameController.text,
                          _passwordController.text,
                        );
                      },
                      child: Text('Login'),
                    ),
                    TextButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: Text(
                    "Doesn't have an account? Create here!",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
