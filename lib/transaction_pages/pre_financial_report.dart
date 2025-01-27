import 'package:flutter/material.dart';

class PreFinancialReport extends StatefulWidget {
  const PreFinancialReport({super.key});

  @override
  State<PreFinancialReport> createState() => _PreFinancialReportState();
}

class _PreFinancialReportState extends State<PreFinancialReport> {
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
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          children: [
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
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            //THE 3 PAGES
            PageView(
              children: [
                _buildPage('This Month', 'You Spent', 'N320',
                    'and your biggest\nspending is from', 'N120', Colors.red),
                _buildPage('This Month', 'You Earned', 'N3720',
                    'and your biggest\nincome is from', 'N1620', Colors.green),
                _buildPageThree('This month',
                    '2 of 12 Budget has exceeded the limit', Colors.deepPurple),
                _buildPageFour(
                    "-Robert Kiyosaki",
                    "'Financial freedom is freedom from fear.'",
                    Colors.deepPurple)

                // _buildPage(
                //     'assets/images/welcomeicon1.png',
                //     'Know where your\n money goes',
                //     Colors.white,
                //     'Track your transactions easily\n with categories and financial report'),
                // _buildPage(
                //     'assets/images/welcomeicon2.png',
                //     'Planning ahead',
                //     Colors.white,
                //     'Setup your budget for each categor\n so you are in control'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String periodtext, String typetext, String mainamounttext,
      String whiteboxtext, String amountext, Color color) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                periodtext,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  typetext,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.money,
                  color: Colors.orange,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                mainamounttext,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 220),
            //white container
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                height: 250,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      whiteboxtext,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          height: 45,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Shopping',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      amountext,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageThree(String periodtext, String typetext, Color color) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                periodtext,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              typetext,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            //white container
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          height: 45,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Shopping',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          height: 45,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            size: 25,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageFour(String periodtext, String typetext, Color color) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              typetext,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              periodtext,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey.shade50,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 15,
              ),
            ),
            //white container
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/financial_report');
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'See the full detail',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
