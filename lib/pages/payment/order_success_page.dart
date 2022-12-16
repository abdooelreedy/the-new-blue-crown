import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theblue_crown/base/custom_button.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';

class OrderSuccessPage extends StatelessWidget {

  final String orderID;
  final int status;

  const OrderSuccessPage({Key? key, required this.orderID, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(status == 0) {
      Future.delayed(Duration(seconds: 1), () {

      });
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  status == 1 ?
                  Icons.check_circle_outline :
                  Icons.warning_amber_outlined,
                size: Dimensions.height20 * 5,
                color: Colors.blue,
              ),
              SizedBox(height: Dimensions.height45,),
              Text(
                status == 1 ?
                'You placed the order successfully' :
                'Your order failed',
                style: TextStyle(fontSize: Dimensions.font26),
              ),
              SizedBox(height: Dimensions.height20,),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height20,
                    vertical: Dimensions.height20
                  ),
                child: Text(
                  status == 1 ?
                  'Successful order' :
                  'Failed order',
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                    color: Theme.of(context).disabledColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Dimensions.height30,),
              Padding(
                  padding: EdgeInsets.all(Dimensions.height20),
                child: CustomButton(
                  buttonText: 'Back to Home',
                  onPressed: () => Get.offAllNamed(RouteHelper.getInitial()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
