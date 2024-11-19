import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas1_mobile_11pplg1_22/Controller/register_controller.dart';
import 'package:pas1_mobile_11pplg1_22/Pages/home_pages.dart';


class RegisterPage extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 188, 121), 
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Color.fromARGB(255, 232, 188, 121),
        automaticallyImplyLeading: false, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                SizedBox(height: 20),

                
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

               
                _registerController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          _registerController.registerUser(
                            _usernameController.text,
                            _passwordController.text,
                            _fullNameController.text,
                            _emailController.text,
                          );
                          
                          
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255), 
                        ),
                      ),

                SizedBox(height: 10),

               
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: Text(
                    'Already Have an account? Log In',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
