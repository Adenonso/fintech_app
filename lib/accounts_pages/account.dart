import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<transactionItem> items = [
    transactionItem(
      itemIcon: Icons.shopping_cart,
      itemType: 'Wallet',
      itemAmount: 40,
      iconColor: Colors.orange.shade600,
      iconContainerColor: Colors.orange.shade100,
    ),
    transactionItem(
      itemIcon: Icons.shopping_cart,
      itemType: 'Paypal',
      itemAmount: 40,
      iconColor: Colors.deepPurple.shade600,
      iconContainerColor: Colors.orange.shade100,
    ),
    transactionItem(
      itemIcon: Icons.shopping_cart,
      itemType: 'Citi',
      itemAmount: 40,
      iconColor: Colors.blue.shade600,
      iconContainerColor: Colors.orange.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 40),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              // foregroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Account'),
              centerTitle: true,
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Account'),
                Text(
                  'N4300',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                height: 400,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      title: items[index],
                    );
                  },
                ),
              ),
            ),
            //ADD NEW WALLET BUTTON
            Container(
              //ADD NEW WALLET
              height: 55,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_account');
                      },
                      child: Text(
                        'Add new wallet',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////THIS IS TO DISPLAY THE RECENT TRANSACTION ITEM LIST
class transactionItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemType;
  final int itemAmount;
  final Color iconColor;
  final Color iconContainerColor;

  const transactionItem(
      {super.key,
      required this.itemIcon,
      required this.itemType,
      required this.itemAmount,
      required this.iconColor,
      required this.iconContainerColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailaccount');
        // Handle your onPressed action here
      },
      child: Row(
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ), //this is the username
                  //This is insight into recent message
                ],
              ),
            ),
          ),
          Text('#' '$itemAmount', style: TextStyle(fontSize: 13))
        ],
      ),
    );
  }
}
