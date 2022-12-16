import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Formalin_60kg extends StatelessWidget {

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

  const Formalin_60kg({
    Key? key,
    this.emptyValue = "3",
    this.netValue = "60",
    this.fullValue = "63",
    this.origin = "Egypt",
    this.type = "Liquid",
    this.company = "SPREA_MISR",
    this.concentration = "38 %",
    this.pro = "2021",
    this.exp = "3_year",
    this.price = "780.00",
    this.name = "Formalin",
    this.description = "الفورمالديهايد أو الفورمالدهيد ويسمى أيضاً الفورمول أو ألدهيد النمل (نسبة إلى النمل)، هو مركب عضوي من فصيلة الألدهيدات ذو الصيغة الكيميائية CH2O وهو غاز عديم اللون في درجة الحرارة العادية، سريع الذوبان في الماء وقابل للاشتعال اسمه النظامي ميثانال (methanal).",
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
          //شركة سبريا مصر لإنتاج الكيماويات والبلاستيك - علامة جودة
          image: AssetImage('assets/products/gmdana.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}