import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/models/products_model.dart';
import '../../data/repository/repo_lists/sub_section_grids/grid_view_of_category_repo.dart';
import '../../data/repository/repo_lists/grid_view_of_sections_repo.dart';
import '../cart_controller.dart';

class GridViewOfSectionsController extends GetxController{
  final GridViewOfSectionsRepo gridViewOfSectionsRepo;

  GridViewOfSectionsController({required this.gridViewOfSectionsRepo});

  List<ProductModel> _gridViewOfSectionsList = [];
  List<ProductModel> get gridViewOfSectionsList => _gridViewOfSectionsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getGridViewOfSectionsList() async {
    Response response = await gridViewOfSectionsRepo.getGridViewOfSectionsList();
    if(response.statusCode == 200) {
      _gridViewOfSectionsList = [];
      _gridViewOfSectionsList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print("..............................got grid view of category..............................");
      update();
    }else{
      print("..............................could not get grid view of category..............................");
    }
  }
}