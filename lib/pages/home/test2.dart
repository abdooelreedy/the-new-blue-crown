// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../controllers/cart_controller.dart';
// import '../../controllers/controller_lists/product_grids/renotex_texapon_controller.dart';
// import '../../utils/dimensions.dart';
// import '../../widgets/custom_big_text.dart';
//
// class Test2 extends StatefulWidget {
//   const Test2({Key? key}) : super(key: key);
//
//   @override
//   State<Test2> createState() => _Test2State();
// }
//
// class _Test2State extends State<Test2> {
//
//   TextEditingController _foo = TextEditingController();
//   int textval = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GetBuilder<CartController>(builder: (cartController) {
//       return GetBuilder<RenotexTexaponController>(builder: (renotexTexapon) {
//
//         var product = Get.find<RenotexTexaponController>().renotexTexaponList[0];
//         Get.find<RenotexTexaponController>().initProduct(product, Get.find<CartController>());
//
//         void click () {
//           setState(() {
//             textval = int.parse(_foo.text);
//             // cartController.customAddItem(product, textval >= product.max_quantity! ? product.max_quantity! : textval);
//           });
//         }
//
//         return SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 150,),
//             // Text("the output is : ${textval}"),
//             // Text("the new quantity of renotex is : ${textval >= product.max_quantity! ? product.max_quantity! : textval}"),
//
//             TextFormField(
//               controller: _foo,
//               keyboardType: TextInputType.number,
//               autofocus: true,
//               inputFormatters: <TextInputFormatter>[
//                 // for below version 2 use this
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 // for version 2 and greater youcan also use this
//                 FilteringTextInputFormatter.digitsOnly
//
//               ],
//               decoration: const InputDecoration(
//                   labelText: "whatever you want",
//                   hintText: "whatever you want",
//                   icon: Icon(Icons.phone_iphone)
//               ),
//             ),
//
//             ElevatedButton(
//               onPressed:
//                 click,
//               style: ElevatedButton.styleFrom(
//                 fixedSize: const Size(
//                     150,
//                     100
//                 ),
//                 primary: Colors.blue,
//               ),
//               child: CustomBigText(
//                 text: "Add_To_Cart".tr,
//                 color: Colors.white,
//                 size: Dimensions.font16,
//               ),
//             )
//           ],
//         ),
//       );});}),
//     );
//   }
// }


import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async{
              final url = Uri.parse(
                // 'https://dev-yakuza.posstree.com/en/',
                'https://ar.wikipedia.org/wiki/%D8%AD%D9%85%D8%B6_%D8%A7%D9%84%D8%B3%D9%84%D9%81%D9%88%D9%86%D9%8A%D9%83',
              );
              if (await canLaunchUrl(url)) {
                launchUrl(url);
              } else {
                // ignore: avoid_print
                print("Can't launch $url");
              }
            },
            child: Center(
              child: Container(
                height: 50,
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "Open an URL",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          InkWell(
            onTap: ()async{
              // SfPdfViewer.network('https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf');
            },
            child: Center(
              child: Container(
                height: 50,
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "Open an PDF",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
