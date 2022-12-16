import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';
import '../../controllers/controller_lists/product_grids/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  bool isClicked = true;
  String _cartTag = "";

  List<String> name = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  List<String> tempArray = [];



  @override
  Widget build(BuildContext context) {
    return
      // WillPopScope(
      // onWillPop: () async {
      //   Get.toNamed(RouteHelper.getInitial());
      //   return true;
      // },
      // child:
      Scaffold(
        appBar: AppBar(
          title: CustomBigText(
            text: "Settings".tr,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:  ElevatedButton(
                    onPressed: () {
                      Get.close(1);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(
                          50,
                          30
                      ),
                      primary: Colors.blue,
                    ),
                    child: CustomBigText(
                      text: "exit".tr,
                      color: Colors.white,
                      size: Dimensions.font16,
                    ),
                  ),
                ),
                // const SizedBox(height: 30,),
                // SizedBox(
                //   height: 150,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     physics: const BouncingScrollPhysics(),
                //     padding: const EdgeInsets.all(12),
                //     itemCount: 8,
                //     separatorBuilder: (BuildContext context, int index) {
                //       return const SizedBox(width: 0,);
                //     },
                //     itemBuilder: (context, index){
                //       return Container(height: 150, width: 150,color: Colors.red,);
                //     },
                //   ),
                // ),
                // const SizedBox(height: 100,),
                //
                //
                // const SizedBox(height: 50,),
                // GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
                //   return recommendedProduct.isLoaded ?
                //   Container(
                //       height: Dimensions.height45,
                //       width: Dimensions.width30 * 30,
                //       child:
                //       ListView.separated(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 5,
                //         separatorBuilder: (BuildContext context, int index) {return const SizedBox(width: 0);},
                //         itemBuilder: (context, index){
                //           return Container(
                //             child: isClicked && recommendedProduct.checkQuantity(-1) == 0 || recommendedProduct.inCartItems.toString() == "0" ?
                //             InkWell(
                //                 onTap: (){
                //                   // recommendedProduct.setQuantity(true);
                //                   // recommendedProduct.addItem(product);
                //                   // setState(() {
                //                   //   isClicked = !isClicked;
                //                   //   _cartTag = '_cartTag';
                //                   //   !isClicked == index;
                //                   //   print("------tapped------- " + index.toString());
                //                   // });
                //                   // setState(() {
                //                   //   if(tempArray.contains(name[index].toString())){
                //                   //     tempArray.remove(name[index].toString());
                //                   //   } else {
                //                   //     tempArray.add(name[index].toString());
                //                   //   }
                //                   // });
                //                   setState(() {
                //                     if(recommendedProduct.recommendedProductList.contains(recommendedProduct.recommendedProductList[index].toString())){
                //                       recommendedProduct.recommendedProductList.remove(recommendedProduct.recommendedProductList[index].toString());
                //                     }else{
                //                       recommendedProduct.recommendedProductList.add(recommendedProduct.recommendedProductList[index]);
                //                     }
                //                   });
                //                 },
                //                 child: Container(
                //                   width: Dimensions.width30 * 5,
                //                   height: Dimensions.height20 * 2,
                //                   margin: EdgeInsets.only(
                //                     left: Dimensions.width20 / 2,
                //                     right: Dimensions.width20 / 2,
                //                   ),
                //                   decoration: BoxDecoration(
                //                     // color: Colors.blue,
                //                     color: recommendedProduct.recommendedProductList.contains(recommendedProduct.recommendedProductList[index].toString()) ? Colors.green : Colors.red,
                //                     borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                   ),
                //                   child: Center(
                //                     child: CustomBigText(
                //                       text: "Add To Cart".tr,
                //                       color: Colors.white,
                //                       // alignment: Alignment.center,
                //                       size: Dimensions.font16,
                //                     ),
                //                   ),
                //                 )
                //             )
                //                 :
                //             //Remove And Add Container
                //             Container(
                //               width: Dimensions.width30 * 5,
                //               height: Dimensions.height20 * 2,
                //               margin: EdgeInsets.only(
                //                 left: Dimensions.width20 / 2,
                //                 right: Dimensions.width20 / 2,
                //               ),
                //               decoration: BoxDecoration(
                //                 // color: Colors.red,
                //                 borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //               ),
                //               child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   //Remove Icon
                //                   GestureDetector(
                //                     onTap: (){
                //                       recommendedProduct.setQuantity(false);
                //                       // recommendedProduct.addItem(product);
                //                       setState(() {
                //                         isClicked = !isClicked;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: Dimensions.width30 * 1.2,
                //                       height: double.infinity,
                //                       margin: EdgeInsets.only(
                //                         right: Dimensions.width20 / 2,
                //                       ),
                //                       decoration: BoxDecoration(
                //                         color: Colors.blue,
                //                         borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                       ),
                //                       child: const Icon(
                //                         Icons.remove,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(width: Dimensions.width10 / 2,),
                //                   //inCartItems
                //                   CustomBigText(
                //                     text: recommendedProduct.inCartItems.toString(), //popularProduct.inCartItems.toString(),
                //                     // alignment: Alignment.center,
                //                   ),
                //                   SizedBox(width: Dimensions.width10 / 2,),
                //                   //Add Icon
                //                   GestureDetector(
                //                     onTap: (){
                //                       recommendedProduct.setQuantity(true);
                //                       // recommendedProduct.addItem(product);
                //                       setState(() {
                //                         isClicked = !isClicked;
                //                       });
                //                     },
                //                     child: Container(
                //                       width: Dimensions.width30 * 1.2,
                //                       height: double.infinity,
                //                       margin: EdgeInsets.only(
                //                         left: Dimensions.width20 / 2,
                //                       ),
                //                       decoration: BoxDecoration(
                //                         color: Colors.blue,
                //                         borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                       ),
                //                       child: const Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           );
                //         },
                //
                //       )) : Container();}),
                // const SizedBox(height: 100,),
                // ElevatedButton(
                //   onPressed: () {
                //     Get.updateLocale(const Locale('en', 'US'),);
                //   },
                //   child: Text('button_1'.tr),
                // ),
                // const SizedBox(height: 30,),
                // ElevatedButton(
                //   onPressed: () {
                //     Get.updateLocale(const Locale('ar', 'EG'),);
                //   },
                //   child: Text('button_2'.tr),
                // ),
                //
                // const SizedBox(height: 30,),

                // Expanded(
                //   child: ListView.builder(
                //     itemCount: name.length,
                //     itemBuilder: (context, index) {
                //       return InkWell(
                //         onTap: (){
                //           setState(() {
                //             if(tempArray.contains(name[index].toString())){
                //               tempArray.remove(name[index].toString());
                //             } else {
                //               tempArray.add(name[index].toString());
                //             }
                //           });
                //         },
                //         child: Card(
                //           child: ListTile(
                //             title: Text(name[index].toString()),
                //             // trailing: Container(
                //             //   height: 50,
                //             //   width: 100,
                //             //   color: tempArray.contains(name[index].toString()) ? Colors.red : Colors.green,
                //             //   child: Center(
                //             //     child: Text(tempArray.contains(name[index].toString()) ? 'Remove' : 'Add'),
                //             //   ),
                //             // ),
                //             trailing: isClicked && tempArray.contains(name[index].toString()) ?//&& recommendedProduct.checkQuantity(-1) == 0 || recommendedProduct.inCartItems.toString() == "0" ?
                //
                //
                //               //Remove And Add Container
                //               Container(
                //                 width: Dimensions.width30 * 5,
                //                 height: Dimensions.height20 * 2,
                //                 margin: EdgeInsets.only(
                //                   left: Dimensions.width20 / 2,
                //                   right: Dimensions.width20 / 2,
                //                 ),
                //                 decoration: BoxDecoration(
                //                   // color: Colors.red,
                //                   borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                 ),
                //                 child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     //Remove Icon
                //                     GestureDetector(
                //                       onTap: (){
                //                         // recommendedProduct.setQuantity(false);
                //                         // recommendedProduct.addItem(product);
                //                         setState(() {
                //                           isClicked = !isClicked;
                //                         });
                //                       },
                //                       child: Container(
                //                         width: Dimensions.width30 * 1.2,
                //                         height: double.infinity,
                //                         margin: EdgeInsets.only(
                //                           right: Dimensions.width20 / 2,
                //                         ),
                //                         decoration: BoxDecoration(
                //                           color: Colors.blue,
                //                           borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                         ),
                //                         child: const Icon(
                //                           Icons.remove,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                     ),
                //                     SizedBox(width: Dimensions.width10 / 2,),
                //                     //inCartItems
                //                     CustomBigText(
                //                       // text: recommendedProduct.inCartItems.toString(), //popularProduct.inCartItems.toString(),
                //                       // alignment: Alignment.center,
                //                     ),
                //                     SizedBox(width: Dimensions.width10 / 2,),
                //                     //Add Icon
                //                     GestureDetector(
                //                       onTap: (){
                //                         // recommendedProduct.setQuantity(true);
                //                         // recommendedProduct.addItem(product);
                //                         setState(() {
                //                           isClicked = !isClicked;
                //                         });
                //                       },
                //                       child: Container(
                //                         width: Dimensions.width30 * 1.2,
                //                         height: double.infinity,
                //                         margin: EdgeInsets.only(
                //                           left: Dimensions.width20 / 2,
                //                         ),
                //                         decoration: BoxDecoration(
                //                           color: Colors.blue,
                //                           borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                         ),
                //                         child: const Icon(
                //                           Icons.add,
                //                           color: Colors.white,
                //                         ),
                //
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ):
                //               InkWell(
                //                   onTap: (){
                //                     // recommendedProduct.setQuantity(true);
                //                     // recommendedProduct.addItem(product);
                //                     // setState(() {
                //                     //   isClicked = !isClicked;
                //                     //   _cartTag = '_cartTag';
                //                     //   !isClicked == index;
                //                     //   print("------tapped------- " + index.toString());
                //                     // });
                //                     setState(() {
                //                       if(tempArray.contains(name[index].toString())){
                //                         tempArray.remove(name[index].toString());
                //                       } else {
                //                         tempArray.add(name[index].toString());
                //                       }
                //                     });
                //                     // setState(() {
                //                     //   if(recommendedProduct.recommendedProductList.contains(recommendedProduct.recommendedProductList[index].toString())){
                //                     //     recommendedProduct.recommendedProductList.remove(recommendedProduct.recommendedProductList[index].toString());
                //                     //   }else{
                //                     //     recommendedProduct.recommendedProductList.add(recommendedProduct.recommendedProductList[index]);
                //                     //   }
                //                     // }
                //                     // );
                //                   },
                //                   child: Container(
                //                     width: Dimensions.width30 * 5,
                //                     height: Dimensions.height20 * 2,
                //                     margin: EdgeInsets.only(
                //                       left: Dimensions.width20 / 2,
                //                       right: Dimensions.width20 / 2,
                //                     ),
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue,
                //                       // color: recommendedProduct.recommendedProductList.contains(recommendedProduct.recommendedProductList[index].toString()) ? Colors.green : Colors.red,
                //                       borderRadius: BorderRadius.circular(Dimensions.radius20 / 2.5),
                //                     ),
                //                     child: Center(
                //                       child: CustomBigText(
                //                         text: "Add To Cart".tr,
                //                         color: Colors.white,
                //                         // alignment: Alignment.center,
                //                         size: Dimensions.font16,
                //                       ),
                //                     ),
                //                   )
                //               )
                //
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          )
      );
    // );
  }
}





