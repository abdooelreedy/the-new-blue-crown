import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _selectedIndex = 0;
//List<int> result = [0, 1, 2] + [3, 4, 5];
  List<String> text3 =
      [
        "Colors.yellow",
        "Colors.red",
        "Colors.green",
        "Colors.blue",
      ] + [
        "Colors.yellow",
        "Colors.red",
        "Colors.green",
        "Colors.blue",
      ];

  List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  List<String> text = [
    "Colors.yellow",
    "Colors.red",
    "Colors.green",
    "Colors.blue",
  ];
  List<String> text2 = [
    "Colors.yellow",
    "Colors.red",
    "Colors.green",
    "Colors.blue",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: Dimensions.screenHeight / 2,
                color: Colors.deepPurple,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  // itemCount: categoryListView.categoryListViewList.length,
                  itemCount: 4,
                  itemBuilder: (context, index2) {
                    return Padding(padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index2;
                              });},
                            child:Container(
                              height: Dimensions.height45 * 5,
                              width: Dimensions.width25 * 5,
                              color: colors[index2],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: Dimensions.screenHeight / 2,
                width: double.maxFinite,
                color: Colors.deepPurple,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  // itemCount: categoryListView.categoryListViewList.length,
                  itemCount: 4,
                  itemBuilder: (context, index3) {
                    index3 = _selectedIndex;
                    print("the _selectedIndex is ------- : " + _selectedIndex.toString());
                    return Padding(padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Dimensions.height45 * 5,
                                width: Dimensions.width25 * 5,
                                color: colors[_selectedIndex],
                                child: Text(text3[_selectedIndex]),
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
    );
  }
}


// Container(
//   width: double.maxFinite,
//   height: Dimensions.screenHeight / 2,
//   color: Colors.grey[500],
// ),



/*
Container(
              width: double.maxFinite,
              height: Dimensions.screenHeight / 2,
              color: Colors.deepPurple,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                // itemCount: categoryListView.categoryListViewList.length,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _selectedIndex = index;
                          },
                          child:Container(
                            height: Dimensions.height45 * 5,
                            width: Dimensions.width25 * 5,
                            color: colors[_selectedIndex],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: Dimensions.screenHeight / 2,
              width: double.maxFinite,
              color: Colors.deepPurple,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                // itemCount: categoryListView.categoryListViewList.length,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: Dimensions.height45 * 5,
                              width: Dimensions.width25 * 5,
                              color: colors[_selectedIndex],
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),

                      ],
                    ),
                  );
                },
              ),
            )
*/
