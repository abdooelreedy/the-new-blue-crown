import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/repo_lists/sub_section_grids/vcosity_enhancers_sub_section_repo.dart';
import 'package:theblue_crown/models/products_model.dart';
import '../../../data/repository/repo_lists/sub_section_grids/grid_view_of_category_repo.dart';
import '../../../data/repository/repo_lists/grid_view_of_sections_repo.dart';
import '../../cart_controller.dart';

class ViscosityEnhancersSubSectionController extends GetxController{
  final ViscosityEnhancersSubSectionRepo viscosityEnhancersSubSectionRepo;

  ViscosityEnhancersSubSectionController({required this.viscosityEnhancersSubSectionRepo});

  List<ProductModel> _viscosityEnhancersSubSectionList = [];
  List<ProductModel> get viscosityEnhancersSubSectionList => _viscosityEnhancersSubSectionList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getViscosityEnhancersSubSectionList() async {
    Response response = await viscosityEnhancersSubSectionRepo.getViscosityEnhancersSubSectionList();
    if(response.statusCode == 200) {
      _viscosityEnhancersSubSectionList = [];
      _viscosityEnhancersSubSectionList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print("..............................got grid view of category..............................");
      update();
    }else{
      print("..............................could not get grid view of category..............................");
    }
  }
}