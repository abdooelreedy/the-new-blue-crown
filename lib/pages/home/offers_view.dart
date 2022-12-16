import 'package:flutter/material.dart';
import 'package:theblue_crown/base/custom_app_bar.dart';

import '../../utils/dimensions.dart';

class OffersView extends StatelessWidget {
  OffersView({Key? key}) : super(key: key);

  List<String> text = [
    "لو لسه ماعملتش أي فاتورة معانا \n ليك 25 جنيه خصم فوري على اول فاتورة ب 500 جنية",
    // "لو إجمالي طلبياتك وصل 5000 جنيه خلال الشهر \n ليك خصم 1.25 % على اول فاتورة ليك فى الشهر الجديد",
    // "لو إجمالي طلبياتك وصل 10,000 جنيه خلال الشهر \n ليك خصم 3 % على اول فاتورة ليك فى الشهر الجديد",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Center(
          child: Text("العروض"),
        ),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(Dimensions.height10),
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) {return const SizedBox(height: 10);},
        itemBuilder: (context, index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            child: Container(
              height: Dimensions.height45 * 5,
              // height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 1.5,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(Dimensions.height10 / 1.5),
                    child: Text(
                      text[index],
                      style: TextStyle(fontSize: Dimensions.font26),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 200),
                    alignment: Alignment.center,
                    height: Dimensions.height45,
                    width: Dimensions.width30 * 4,
                    // color: Colors.red,
                    child: Text(
                        "تفاصيل",
                      style: TextStyle(
                          fontSize: Dimensions.font20,
                        color: Colors.blue
                      ),

                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
