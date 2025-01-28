import 'package:flutter/material.dart';

class DetailBudget extends StatefulWidget {
  const DetailBudget({super.key});

  @override
  State<DetailBudget> createState() => _DetailBudgetState();
}

class _DetailBudgetState extends State<DetailBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
        child: Column(
          spacing: 10,
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Detail Budget'),
              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap: () {
                      _showModalBottomSheet(context);
                    },
                    child: Icon(Icons.delete))
              ],
            ),
            Container(
              width: 170,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Container(
                      width: 40,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.orange.shade600,
                      ),
                    ),
                    Text(
                      'Shopping',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                'Remaining',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Center(
              child: Text(
                'N 202',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              width: 278,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Container(
                      width: 35,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        size: 20,
                        Icons.warning_amber,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "You've exceeded the limit",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 5,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit_budget');
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Remove this budget?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Are you sure you want to remove this budget?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        border: Border.all(color: Colors.deepPurple.shade100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              color: Colors.deepPurple.shade100,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
