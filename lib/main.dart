import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Quicksand',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Header
              new Container(
                height: 250,
                width: double.infinity,
                color: Color(0xFFFDD148),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 50,
                      right: 100,
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(250),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      left: 150,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              new Column(
                children: <Widget>[
                  //Row Account and setting
                  new Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                  image: AssetImage('assets/huy.jpg')),
                              border: Border.all(
                                  color: Colors.white, width: 3)),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Huy Nguyen',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Text('1010***69',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Colors.black.withOpacity(0.6))),
                                  ],
                                ),
                              ),
                            )),
                        IconButton(
                            icon: Icon(Icons.settings,
                                color: Colors.white, size: 30),
                            onPressed: null),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //Item Horizoltal
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _itemNumInfo(
                        context,
                        name: 'Favorites',
                        icon: Icons.folder_shared,
                      ),
                      _itemNumInfo(
                        context,
                        name: 'Wallet',
                        icon: Icons.account_balance_wallet,
                      ),
                      _itemNumInfo(
                        context,
                        name: 'Footprint',
                        icon: Icons.print,
                      ),
                      _itemNumInfo(
                        context,
                        name: 'Coupon',
                        icon: Icons.computer,
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  //Item Card
                  new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _itemCard(
                            name: 'Pending payment',
                            image: 'assets/card.png',
                            count: '5',
                          ),
                          _itemCard(
                            name: 'To be shipped',
                            image: 'assets/box.png',
                            count: '2',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _itemCard(
                            name: 'To be received',
                            image: 'assets/trucks.png',
                            count: '8',
                          ),
                          _itemCard(
                            name: 'Return / Replace',
                            image: 'assets/returnbox.png',
                            count: '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  //List Item
                  _listItem(name: 'Gift Card', color: Colors.red, icon: Icons.account_box),
                  _listItem(name: 'Bank Card', color: Color(0xFFE89300), icon: Icons.credit_card),
                  _listItem(name: 'Replacement code', color: Color(0xFFFB8662), icon: Icons.grid_on),
                  _listItem(name: 'Consulting collection', color: Colors.blue, icon: Icons.pages),
                  _listItem(name: 'Customer service', color: Color(0xFFECB800), icon: Icons.person),

                  //Item Grid
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _controller,
          indicatorColor: Colors.yellow,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.event_seat, color: Colors.grey)),
            Tab(icon: Icon(Icons.timer, color: Colors.grey)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_outline, color: Colors.yellow))
          ],
        ),
      ),
    );
  }

  Widget _listItem({String name, Color color, IconData icon}){
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: color.withOpacity(0.3),
              ),
              child: Icon(icon, size: 30, color: Colors.white,),
            ),
            SizedBox(width: 15,),
            Expanded(child: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }

  Widget _itemNumInfo(BuildContext context, {String name, IconData icon}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: IconButton(
              icon: Icon(
                icon,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Text(name,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _itemCard({String image, String name, String count}) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width / 2 - 20,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
              Expanded(
                  child: Text(name,
                      style: TextStyle(fontSize: 18, color: Colors.black))),
              Expanded(
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
