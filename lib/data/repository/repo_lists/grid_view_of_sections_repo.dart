import 'package:get/get.dart';
import 'package:theblue_crown/data/api/api_client.dart';
import 'package:theblue_crown/utils/app_constants.dart';

class GridViewOfSectionsRepo extends GetxService{
  final ApiClient apiClient;


  GridViewOfSectionsRepo({required this.apiClient});

  Future<Response> getGridViewOfSectionsList() async {
    return await apiClient.getData(AppConstants.SECTIONSGRIDVIEW_URI);
  }
}