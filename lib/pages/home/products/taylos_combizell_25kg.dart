import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Taylos_Combizell_25kg extends StatelessWidget {

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

  const Taylos_Combizell_25kg({
    Key? key,
    this.emptyValue = "0.1",
    this.netValue = "25",
    this.fullValue = "5.1",
    this.origin = "China",
    this.type = "Powder",
    this.company = "TIANPU CHEM",
    this.concentration = "40 thousand",
    this.pro = "2022",
    this.exp = "2_year",
    this.price = "5350.00",
    this.name = "Taylos_Combizil",
    this.description = "ميثيل السليولوز الكربوكسيلي أو كَرْبُوكْسِي ميثيل سليولوز هو أحد مشتقات السليولوز ذو مجموعات كربوكسي ميثيل (-CH2-COOH) مرتبطة ببعض مجموعات الهيدروكسيل لمواحيد الغلكوبيرانوز المكونة لسلسلة السيلولوز. وتستخدم عادة بشكل أملاح الصوديوم، مثل صوديوم ميثيل السليولوز الكربوكسيلي.",
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
          image: AssetImage('assets/products/taylos_combizell_25kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}