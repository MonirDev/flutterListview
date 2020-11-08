import 'package:flutter/material.dart';
import 'package:flutter_itemstack_listview/constants.dart';

class FoodSlider extends StatefulWidget {
  @override
  _FoodSliderState createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  List<Widget> foodItems = [];

  void getFoodData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Container(
          height: 150.0,
          width: 220.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.grey[200]),
        ),
      ));
    });
    setState(() {
      foodItems = listItems;
    });
  }

  @override
  void initState() {
    getFoodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: foodItems.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return foodItems[index];
        });
  }
}
