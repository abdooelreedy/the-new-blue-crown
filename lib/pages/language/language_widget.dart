import 'package:flutter/material.dart';
import 'package:theblue_crown/utils/dimensions.dart';

import '../../controllers/language_controller.dart';
import '../../models/language_model.dart';
import '../../utils/app_constants.dart';

class LanguageWidget extends StatelessWidget {

  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  const LanguageWidget({
    Key? key,
    required this.languageModel,
    required this.localizationController,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(
            Locale(
              AppConstants.languages[index].languageCode,
              AppConstants.languages[index].countryCode,
            ),
        );
        localizationController.setSelectIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.height10),
        margin: EdgeInsets.all(Dimensions.height10 / 2),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 5,
              spreadRadius: 1
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Dimensions.height10 / 2),
                  Text(languageModel.languageName,),
                ],
              ),
            ),

            localizationController.selectedIndex == index ?
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: Dimensions.height45,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: Dimensions.font26,
                    )
                ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
