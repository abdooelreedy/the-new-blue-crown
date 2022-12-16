import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/base/custom_loader.dart';
import 'package:theblue_crown/controllers/order_controller.dart';
import 'package:theblue_crown/models/order_model.dart';
import 'package:theblue_crown/utils/dimensions.dart';

class ViewOrder extends StatelessWidget {

  final bool isCurrent;

  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController){

        if(orderController.isLoading == false){
          late List<OrderModel> orderList;
          if(orderController.currentOrderList.isNotEmpty){
            orderList = isCurrent ?
            orderController.currentOrderList.reversed.toList() :
            orderController.historyOrderList.reversed.toList();
          }
          return SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 / 2,
                  vertical: Dimensions.height10 / 2
              ),
              child: ListView.builder(
                  itemCount: orderList.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () => null,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("order_ID".tr),
                                    SizedBox(width: Dimensions.width10 / 2,),
                                    Text('#${orderList[index].id.toString()}'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(Dimensions.height10 / 2),
                                        child: Text(
                                          '${orderList[index].orderStatus}'.tr,
                                          style: const TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height10 / 2,),
                                    InkWell(
                                      onTap: () => null,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
                                          border: Border.all(width: 1, color: Colors.blue)
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(Dimensions.height10 / 2),
                                          child: Text("Track_Order".tr),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          );
        }else{
          return const CustomLoader();
        }
        },
      ),
    );
  }
}
