import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/order_controller.dart';
import 'package:theblue_crown/utils/dimensions.dart';

class DeliveryOptions extends StatelessWidget {

  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOptions({
    Key? key,
    required this.value,
    required this.title,
    required this.amount,
    required this.isFree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return Row(
        children: [
          Radio(
            value: value,
            groupValue: orderController.orderType,
            onChanged: (String? value) => orderController.setDeliveryType(value!),
            activeColor: Colors.blue,
          ),
          SizedBox(width: Dimensions.width10 / 2,),
          Text(title,),
          SizedBox(width: Dimensions.width10 / 2,),
          Text(
            '${(value == 'take away' || isFree) ? '(free)' : '(\$${amount / 10})'}',
          ),
        ],
      );
    });
  }
}
