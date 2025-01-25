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
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            ),
            //THE 3 PAGES
            PageView(
              children: [
                _buildPage('This Month', 'You Spent', 'N320',
                    'and your biggest spending is from', 'N120', Colors.red),
                _buildPage('This Month', 'You Earned', 'N3720',
                    'and your biggest income is from', 'N1620', Colors.green)

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
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                typetext,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                mainamounttext,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Text(
                    whiteboxtext,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.shopping_cart_sharp,
                          size: 25,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'lookiy',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    amountext,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
