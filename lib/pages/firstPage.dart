import 'package:flutter/material.dart';
import '../pages/foodSlider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        border:
                            Border.all(color: Colors.grey[200], width: 1.0)),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5.0, 20.0, 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/monir.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 0),
            child: Container(
              height: 100.0,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today Find',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Delicious ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Food',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 30.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'search',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.yellow[800],
                  unselectedLabelColor: Colors.grey[500],
                  labelStyle: TextStyle(fontSize: 20.0),
                  labelPadding: const EdgeInsets.all(0),
                  unselectedLabelStyle: TextStyle(fontSize: 12.0),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: 'Popular',
                    ),
                    Tab(
                      text: 'Pizza',
                    ),
                    Tab(
                      text: 'Top',
                    ),
                    Tab(
                      text: 'Food',
                    ),
                    Tab(
                      text: 'All Menu',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40.0, 20.0, 40.0),
            child: Container(
              height: 280.0,
              width: double.infinity,
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  FoodSlider(),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
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
