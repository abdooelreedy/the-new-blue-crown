import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class TaylosCategoryListViewRepo extends GetxService{
  final ApiClient apiClient;


  TaylosCategoryListViewRepo({required this.apiClient});

  Future<Response> getTaylosCategoryListViewList() async {
    return await apiClient.getData(AppConstants.TAYLOSCATEGORYListVIEW_URI);
  }
}