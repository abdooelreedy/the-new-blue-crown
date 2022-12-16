import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/repo_lists/product_grids/recommended_product_repo.dart';
import 'package:theblue_crown/models/products_model.dart';

import '../../../data/repository/repo_lists/category_lists/category_of_texapon_list_view_repo.dart';

class CategoryOfTexaponListViewController extends GetxController{
  final CategoryOfTexaponListViewRepo categoryOfTexaponListViewRepo;

  CategoryOfTexaponListViewController({required this.categoryOfTexaponListViewRepo});

  List<ProductModel> _categoryOfTexaponListViewList = [];
  List<ProductModel> get categoryOfTexaponListViewList => _categoryOfTexaponListViewList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getCategoryOfTexaponListViewList() async {
    Response response = await categoryOfTexaponListViewRepo.getCategoryOfTexaponListViewList();
    if(response.statusCode == 200) {
      _categoryOfTexaponListViewList = [];
      _categoryOfTexaponListViewList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    }else{
      print("could not get category list view");
    }
  }
}