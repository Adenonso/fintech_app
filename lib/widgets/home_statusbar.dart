import 'package:flutter/material.dart';

class HomeStatusbar extends StatefulWidget {
  const HomeStatusbar({super.key});

  @override
  State<HomeStatusbar> createState() => _HomeStatusbarState();
}

class _HomeStatusbarState extends State<HomeStatusbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //This Row is Profile pic, Month and Notification Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/man1.jpg'),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down_outlined),
                    Text(
                      'October',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.notifications,
                size: 35,
                color: Colors.deepPurple,
              )
            ],
          ),
          //This center is for Account Balance
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Account Balance',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                Text(
                  '₦9400',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //This is for Income and Expense button
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //This is for income button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/income');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.green,
                                  size: 22,
                                ),
                                Icon(
                                  Icons.wallet,
                                  color: Colors.green,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Income',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                              Text('₦4000',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //This is for expense button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/expense');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  color: Colors.red,
                                  size: 22,
                                ),
                                Icon(
                                  Icons.wallet,
                                  color: Colors.red,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Expenses',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                              Text('₦800000',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
