import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class CategoryOfTexaponListViewRepo extends GetxService{
  final ApiClient apiClient;


  CategoryOfTexaponListViewRepo({required this.apiClient});

  Future<Response> getCategoryOfTexaponListViewList() async {
    return await apiClient.getData(AppConstants.CATEGORYOFTEXAPONListVIEW_URI);
  }
}