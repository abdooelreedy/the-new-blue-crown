import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/utils/dimensions.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/custom_big_text.dart';
import '../home/home_view.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height20 * 4,
            left: Dimensions.width20,
            right: Dimensions.width20
        ),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/paymentBackground.png',
              ),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height45 * 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    'assets/images/success.png',
                  ),
                ),
              ),
            ),
            Text(
              "Success !",
              style: TextStyle(
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            Text(
              "Payment is Completed for 2 bills",
              style: TextStyle(
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            Container(
              height: Dimensions.height30 * 5,
              width: Dimensions.width30 * 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (_, index){
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Dimensions.height15,
                                      bottom: Dimensions.height10,
                                      left: Dimensions.width20,
                                      right: Dimensions.width20,
                                    ),
                                    width: Dimensions.width25 * 2,
                                    height: Dimensions.height45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                                        color: Colors.green
                                    ),
                                    child: Icon(Icons.done, size: Dimensions.height30, color: Colors.white,),
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "KenGen Power",
                                        style: TextStyle(
                                            fontSize: Dimensions.font16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.height10,),
                                      Text(
                                        "ID : 45635468",
                                        style: TextStyle(
                                            fontSize: Dimensions.font16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Text(
                                    "\$ 12346.00",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                              Divider(thickness: 2, color: Colors.grey.withOpacity(0.5),),
                            ],
                          ),
                        );
                      }
                  ),
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                Text(
                  "\$ 25438.00",
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 1.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height45 * 3.5,),
            GestureDetector(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: backgroundColor,
                        child: Icon(Icons.share),
                      ),
                      Text("Share")
                    ],
                  ),
                  SizedBox(width: Dimensions.width30 * 4,),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: backgroundColor,
                        child: Icon(Icons.print),
                      ),
                      Text("print")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.height45 * 1.5,
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                  ),
                  child: Center(
                    child: CustomBigText(
                      text: "Done",
                      color: Colors.white,
                      // alignment: Alignment.center,
                      size: Dimensions.font26,
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
