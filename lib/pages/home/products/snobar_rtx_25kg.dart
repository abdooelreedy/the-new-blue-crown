import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Snobar_Rtx_25kg extends StatelessWidget {

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

  const Snobar_Rtx_25kg({
    Key? key,
    this.emptyValue = "1 كجم",
    this.netValue = "25 كجم",
    this.fullValue = "26 كجم",
    this.origin = "أسبانيا",
    this.type = "سائل",
    this.company = "Setranol D60",
    this.concentration = "60 %",
    this.pro = "2022",
    this.exp = "سنتين",
    this.price = "3000.00",
    this.name = "زيت صنوبر سيترانول",
    this.description = "زيت الصنوبر هو زيت أساسي يتم الحصول عليه عن طريق التقطير البخاري للجذوع والإبر والأغصان والأقماع من مجموعة متنوعة من أنواع الصنوبر،[2] وخاصة صنوبر سيلفستريس.[3] اعتبارًا من عام 1995، كان زيت الصنوبر الاصطناعي «أكبر مشتق منفرد من زيت التربنتين»،[4] وشكلت زيوت الصنوبر الاصطناعية 90% من المبيعات حتى عام 2000.",
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
          image: AssetImage('assets/products/snobar_rtx_25kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}