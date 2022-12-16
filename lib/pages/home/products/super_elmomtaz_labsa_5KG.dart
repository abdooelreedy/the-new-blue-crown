import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Super_Elmomtaz_Labsa_5KG extends StatelessWidget {

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

  const Super_Elmomtaz_Labsa_5KG({
    Key? key,
    this.emptyValue = "94",
    this.netValue = "5",
    this.fullValue = "5.094",
    this.origin = "Egypt",
    this.type = "Liquid",
    this.company = "Loloaa",
    this.concentration = "85 %",
    this.pro = "2022",
    this.exp = "3_year",
    this.price = "230",
    this.name = "Super_ElMomtaz_Labsa",
    this.description = "حمض السلفونيك يشير إلى عضو في صنف المركبات العضوية الكبريتية ذات الصيغة العامة RS(=O)2–OH حيث R هي مجموعة ألكيل أو أريل عضوية ومجموعة S(=O)2–OH هيدوكسيد السلفونيل.[1] حمض السلفونيك يمكن أن يعتقد أنه حمض الكبريت مع مجموعة هيدروكسيل مستبدلة بـ مستبدل عضوي. المركب الأب (ذرة الهيدروجين تستبدل بالمستبدل العضوي) هو مركب افتراضي لحمض الكبريتوز. أملاح أو إسترات الحموض السلفونية تسمى سلفونات. ويعرف أيضاً باسم شائع (الزفتة) وغالباً ما يطلق اسم حمض السلفونيك أو الزفتة على حمض سلفونات دودوسيل البنزن dodecylbenzenesulfonic acid",
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
          image: AssetImage('assets/products/elmomtaz_labsa_5KG.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}