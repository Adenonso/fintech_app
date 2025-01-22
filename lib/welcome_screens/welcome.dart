import 'package:flutter/material.dart';

class WelcomeSwipePages extends StatefulWidget {
  @override
  State<WelcomeSwipePages> createState() => _WelcomeSwipePagesState();
}

class _WelcomeSwipePagesState extends State<WelcomeSwipePages> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Stack(
          children: [
            //THE 3 PAGES
            PageView(
              children: [
                _buildPage(
                    'assets/images/welcomeicon3.png',
                    'Gain total control\n of your money',
                    Colors.white,
                    'Become your own money manager\n and make every cent count'),
                _buildPage(
                    'assets/images/welcomeicon1.png',
                    'Know where your\n money goes',
                    Colors.white,
                    'Track your transactions easily\n with categories and financial report'),
                _buildPage(
                    'assets/images/welcomeicon2.png',
                    'Planning ahead',
                    Colors.white,
                    'Setup your budget for each categor\n so you are in control'),
              ],
            ),
            // PAGE INDICATORS
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ), //SIGNUP AND LOGIN BUTTON
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    //SIGN UP BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
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
                    SizedBox(
                        height: 10.0), // Add spacing between the containers
                    //LOGIN BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0), // Add some padding
                        decoration: BoxDecoration(
                          color: Colors.deepPurple
                              .shade100, // Background color for the first container
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      String imagelink, String maintext, Color color, String subtext) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(width: 300, height: 400, imagelink),
            Center(
              child: Text(
                maintext,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                subtext,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
