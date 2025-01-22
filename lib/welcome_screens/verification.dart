import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _Verification();
}

class _Verification extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            AppBar(
              title: const Text('Verification'),
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 130),
            Text(
              'Enter your\nverification code',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(
                  labelText: "Enter code here", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              maxLength: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your code";
                }
                return null;
              },
            ),
            SizedBox(height: 40.0),
            Text(
              'We sent a verification code to your email\ndaniel2@gmail.com .You can check your inbox.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                "Didn't receive the code? Send again",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.deepPurple,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0), // Add some padding
                decoration: BoxDecoration(
                  color: Colors
                      .deepPurple, // Background color for the first container
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // Add spacing between the containers
          ],
        ),
      ),
    );
  }
}
