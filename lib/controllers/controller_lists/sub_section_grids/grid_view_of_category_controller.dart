import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/products_model.dart';
import '../../../data/repository/repo_lists/sub_section_grids/grid_view_of_category_repo.dart';
import '../../cart_controller.dart';

class GridViewOfCategoryController extends GetxController{
  final GridViewOfCategoryRepo gridViewOfCategoryRepo;

  GridViewOfCategoryController({required this.gridViewOfCategoryRepo});

  List<ProductModel> _gridViewOfCategoryList = [];
  List<ProductModel> get gridViewOfCategoryList => _gridViewOfCategoryList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getGridViewOfCategoryList() async {
    Response response = await gridViewOfCategoryRepo.getGridViewOfCategoryList();
    if(response.statusCode == 200) {
      _gridViewOfCategoryList = [];
      _gridViewOfCategoryList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print("..............................got grid view of category..............................");
      update();
    }else{
      print("..............................could not get grid view of category..............................");
    }
  }
}