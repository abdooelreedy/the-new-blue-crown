import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/language_controller.dart';
import 'package:theblue_crown/pages/home/home_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_big_text.dart';
import 'language_widget.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<LocalizationController>(builder: (localizationController) {
          return Column(
            children: [
              Expanded(
                  child: Center(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.all(Dimensions.height10 / 2),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset("assets/images/splash.png", width: Dimensions.width30 * 4,),
                                ),
                                SizedBox(height: Dimensions.height30,),

                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                                  child: Text('Select_Language'.tr,),
                                ),
                                SizedBox(height: Dimensions.height10,),

                                GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1
                                  ),
                                  itemCount: 2,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      // Container(
                                      //   width: Dimensions.height30 * 10,
                                      //   height: Dimensions.height30 * 10,
                                      //   color: index == 0 ?
                                      //       Colors.red : Colors.blueGrey,
                                      // ),
                                  LanguageWidget(
                                      languageModel: localizationController.languages[index],
                                      localizationController: localizationController,
                                      index: index
                                  )
                                ),
                                SizedBox(height: Dimensions.height45,),
                                Text('You_Can_Change_Language'.tr),
                                SizedBox(height: Dimensions.height10,),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(RouteHelper.getInitial());
                                    Navigator.pushReplacementNamed(context, "/initial");
                                  },
                                  child: Container (
                                    padding: EdgeInsets.only(top: Dimensions.height45 / 2, bottom: Dimensions.height45 / 2, left: Dimensions.width20, right: Dimensions.width20,),
                                    child: CustomBigText(
                                      text: "Save".tr,
                                      size: Dimensions.font26,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          );
        }),

      ),
    );
  }
}
