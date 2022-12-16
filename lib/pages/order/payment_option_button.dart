import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/utils/dimensions.dart';

import '../../controllers/order_controller.dart';

class PaymentOptionButton extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subTitle;
  final int index;

  const PaymentOptionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){

      bool _selected = orderController.paymentIndex == index;

      return InkWell(
        onTap: () => orderController.setPaymentIndex(index),
        child: Container(
          padding: EdgeInsets.only(bottom: Dimensions.width10 / 2,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 5,
                    spreadRadius: 1
                ),
              ]
          ),
          child: ListTile(
            leading: Icon(
              icon,
              size: 40,
              color: _selected ?
              Colors.blue :
              Theme.of(context).disabledColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: Dimensions.font20
              ),
            ),
            subtitle: Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontSize: Dimensions.font16
              ),
            ),
            trailing: _selected ?
            Icon(Icons.check_circle, color: Colors.blue,) :
            null,
          ),
        ),
      );
    });
  }
}
