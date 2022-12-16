import 'package:theblue_crown/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/place_order_model.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class OrderRepo {

  final ApiClient apiClient;

  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async {
    print("The placeOrder object in placeOrder in OrderRepo is  :::::::::::::::: " + placeOrder.toString());
    return await apiClient.postData(
        AppConstants.PLACE_ORDER_URI,
        placeOrder.toJson(),
    );
  }

  Future<Response> getOrderList() async {
    return await apiClient.getData(AppConstants.ORDER_LIST_URI,);
  }

}