import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Mal7_25KG extends StatelessWidget {

  final String name;
  final String price;
  final Image img;
  final String emptyValue;
  final String netValue;
  final String fullValue;
  final String origin;
  final String type;
  final String company;
  final String concentration;
  final String description;
  final String pro;
  final String exp;

  const Mal7_25KG({
    Key? key,
    this.emptyValue = "0.08",
    this.netValue = "25",
    this.fullValue = "25.08",
    this.origin = "Egypt",
    this.type = "Grains",
    this.company = "El_SENHORY",
    this.concentration = "99 %",
    this.pro = "2022",
    this.exp = "3_year",
    this.price = "220",
    this.name = "El_SENHORY_Salt",
    this.description = "كبريتات المغنيسيوم (أو سلفات المغنيسيوم) هو مركب غير عضوي (مركب كيميائي) يحتوي على المغنيسيوم والكبريت والأكسجين، ذو الصيغة MgSO4. يسمى عادة الملح الإنجليزي (ٍEpsom Salt) نسبة لينبوع سبخة ملحية في مدينة إبسوم في ساري بإنجلترا، حيث تم إنتاج الملح من الينابيع التي تنتج من اختلاط الطباشير المسامي في داونز الشمالية مع الطين غير المسامي في لندن. يتشكل ملح ابسوم بشكل طبيعي كفلز نقي.",
    this.img = const Image(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class Image extends StatelessWidget {
  const Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width30 * 9,
      height: Dimensions.height45 * 8,
      decoration: const BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/products/mal7_25KG.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}