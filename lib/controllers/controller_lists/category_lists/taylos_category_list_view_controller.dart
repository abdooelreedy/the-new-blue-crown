import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/recommended_product_repo.dart';
import 'package:theblue_crown/data/repository/repo_lists/category_lists/taylos_category_list_view_repo.dart';
import 'package:theblue_crown/models/products_model.dart';

class TaylosCategoryListViewController extends GetxController{
  final TaylosCategoryListViewRepo taylosCategoryListViewRepo;

  TaylosCategoryListViewController({required this.taylosCategoryListViewRepo});

  List<ProductModel> _taylosCategoryListViewList = [];
  List<ProductModel> get taylosCategoryListViewList => _taylosCategoryListViewList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getTaylosCategoryListViewList() async {
    Response response = await taylosCategoryListViewRepo.getTaylosCategoryListViewList();
    if(response.statusCode == 200) {
      _taylosCategoryListViewList = [];
      _taylosCategoryListViewList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    }else{
      print("could not get category list view");
    }
  }
}