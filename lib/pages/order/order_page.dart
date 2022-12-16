import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/base/custom_app_bar.dart';
import 'package:theblue_crown/controllers/auth_controller.dart';
import 'package:theblue_crown/controllers/order_controller.dart';
import 'package:theblue_crown/pages/order/view_order.dart';
import 'package:theblue_crown/utils/dimensions.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin{

  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState(){
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My_Orders'.tr,
      ),
      body: Column(
        children: [
          SizedBox(
            width: Dimensions.screenWidth,
            child: TabBar(
              controller: _tabController,
              indicatorWeight: 3,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "current".tr, ),
                Tab(text: "history".tr,),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ViewOrder(isCurrent: true),
                ViewOrder(isCurrent: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
