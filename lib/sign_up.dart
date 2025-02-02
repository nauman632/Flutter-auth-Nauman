import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for TextField inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Sign-up function (without Firebase)
  void _signUp(BuildContext context) {
    // Validate and collect user input
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Example of form validation (you can adjust to your needs)
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    } else {
      // Here, you would typically send data to your backend or handle the sign-up
      // Since we're not using Firebase, we'll simulate a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-up successful!')),
      );

      // Navigate to the home page (or any other page you want to navigate to after sign-up)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()), // Replace with your home page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")), // AppBar for sign-up page
      body: Padding(
        padding: EdgeInsets.all(16.0), // Padding for form elements
        child: Column(
          children: [
            // Name TextField
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            // Password TextField
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true, // Password is hidden
            ),
            SizedBox(height: 20), // Space between button and fields
            // Sign-up button
            ElevatedButton(
              onPressed: () {
                _signUp(context); // Call _signUp and pass context
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }

  home() {}
}
