import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

///THIS IS WHAT IS DISPLAYED IN THE MAIN HOME SCREEN
class HomeRecentTransaction extends StatelessWidget {
  HomeRecentTransaction({super.key});

  List<transactionItem> items = [
    transactionItem(
      itemIcon: Icons.shopping_cart,
      itemType: 'Shopping',
      itemDescription: 'Buy some groceries',
      itemAmount: 40,
      itemTime: 23,
      iconColor: Colors.orange.shade600,
      iconContainerColor: Colors.orange.shade100,
    ),
    transactionItem(
      itemIcon: Icons.list,
      itemType: 'Subscription',
      itemDescription: 'Netflix',
      itemAmount: 200,
      itemTime: 23,
      iconColor: Colors.deepPurple.shade600,
      iconContainerColor: Colors.deepPurple.shade50,
    ),
    transactionItem(
      itemIcon: Icons.fastfood,
      itemType: 'Food',
      itemDescription: 'Barbecue and small chops',
      itemAmount: 10,
      itemTime: 2,
      iconColor: Colors.blue.shade600,
      iconContainerColor: Colors.blue.shade50,
    ),
    transactionItem(
      itemIcon: Icons.fastfood,
      itemType: 'Subscription',
      itemDescription: 'Data',
      itemAmount: 70,
      itemTime: 2,
      iconColor: Colors.red.shade600,
      iconContainerColor: Colors.red.shade50,
    ),
    transactionItem(
      itemIcon: Icons.shopping_cart,
      itemType: 'Shopping',
      itemDescription: 'Buy a car',
      itemAmount: 100,
      itemTime: 56,
      iconColor: Colors.blue.shade600,
      iconContainerColor: Colors.blue.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => a.itemTime.compareTo(b.itemTime));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          //Spend Frequency container
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Spend Frequency',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),
          //chart container
          Container(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    dotData: FlDotData(show: false),
                    spots: items.asMap().entries.map((entry) {
                      int index = entry.key;
                      transactionItem item = entry.value;
                      return FlSpot(
                          index.toDouble(), item.itemAmount.toDouble());
                    }).toList(),
                    isCurved: true,
                    colors: [Colors.deepPurple],
                    barWidth: 4,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        Colors.deepPurple.withOpacity(0.5),
                        Colors.white.withOpacity(0.3),
                      ],
                      gradientFrom: Offset(0, 12),
                      gradientTo: Offset(6, 12),
                    ),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: false,
                    getTitles: (double value) {
                      return items[value.toInt()].itemType;
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          //Categories Selector container
          CategoriesSelector(),
          //recent transaction heading container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurple.shade100)),
                  child: Text(
                    'See All',
                  ))
            ],
          ),
          //recent transaction list container
          Expanded(
            child: Container(
              height: 400,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(vertical: 30),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    title: items[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////THIS IS TO DISPLAY THE RECENT TRANSACTION ITEM LIST
class transactionItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemType;
  final String itemDescription;
  final int itemAmount;
  final int itemTime;
  final Color iconColor;
  final Color iconContainerColor;

  const transactionItem(
      {super.key,
      required this.itemIcon,
      required this.itemType,
      required this.itemDescription,
      required this.itemAmount,
      required this.itemTime,
      required this.iconColor,
      required this.iconContainerColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 40,
                decoration: BoxDecoration(
                    color: iconContainerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  itemIcon,
                  size: 25,
                  color: iconColor,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemType,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ), //this is the username
                      Text(
                        itemDescription,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                      ) //This is insight into recent message
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text('N' '$itemAmount', style: TextStyle(fontSize: 13)),
                  Text('$itemTime' 'mins', style: TextStyle(fontSize: 13)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

////////THIS IS TO SET THE RECENT TRANSACTION TO A SPECIFIC DAY, WEEK, MONTH, YEAR
class CategoriesSelector extends StatefulWidget {
  CategoriesSelector({super.key});
  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Today', "Week", "Month", "Year"];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green.shade300,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    index == selectedIndex
                        ? Colors.orange.shade100
                        : Colors.white.withOpacity(0.1)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                elevation: MaterialStateProperty.all(0)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: Text(
                categories[index],
                style: TextStyle(
                    color: index == selectedIndex
                        ? Colors.orange.shade600
                        : Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
