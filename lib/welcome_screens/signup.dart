import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20),
          AppBar(
            title: const Text('Signup'),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              // key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // controller: _nameController,
                    decoration: InputDecoration(
                        labelText: "Name", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    // controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    // controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(Icons.check_box_outline_blank),
                      Text(
                          'By signing up, you agree to our Terms of Service\n and Privacy Policy'),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/verification');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0), // Add some padding
                      decoration: BoxDecoration(
                        color: Colors
                            .deepPurple, // Background color for the first container
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0), // Add spacing between the containers
                  Center(
                    child: Text(
                      'Or with',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0), // Add some padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors
                            .white, // Background color for the first container
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.stop_circle_sharp),
                          Center(
                            child: Text(
                              'Sign Up with Google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
