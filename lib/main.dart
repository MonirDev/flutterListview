import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemstack_listview/constants.dart';
import 'package:flutter_itemstack_listview/pages/default.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopController = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
        height: 150.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['name'],
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post['brand'],
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  ),
                  Text(
                    '\$ ${post['price']}',
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  )
                ],
              ),
              Image.asset(
                'assets/images/${post['image']}',
                height: double.infinity,
              )
            ],
          ),
        ),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopController = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Loyality Cards',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    'Menu',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopController ? 0 : 1,
                child: AnimatedContainer(
                    width: size.width,
                    duration: const Duration(milliseconds: 200),
                    alignment: Alignment.topCenter,
                    height: closeTopController ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.7,
                                child: itemsData[index]),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Most\nFavourites',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Newest',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Super\nSavings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
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
