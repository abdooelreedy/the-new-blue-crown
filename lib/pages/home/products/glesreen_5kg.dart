import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Glesreen_5kg extends StatelessWidget {

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

  const Glesreen_5kg({
    Key? key,
    this.emptyValue = "94 جم",
    this.netValue = "5 كجم",
    this.fullValue = "5.094 كجم",
    this.origin = "باكستان",
    this.type = "سائل لزج",
    this.company = "OLEOCROP",
    this.concentration = "99.7 %",
    this.pro = "2022",
    this.exp = "سنتين",
    this.price = "425.00",
    this.name = "جلسرين اوليكروب",
    this.description = "يُعد الجلسرين مركبًا كيميائيًا غير سام وهو سائل لزج حلو الطعم.يحتوي الجلسرين على ثلاثة جزئيات من الكربون وثمانية جزئيات من الهيدورجين إلى جانب ثلاثة جزئيات أخرى من الأكسجين، بمعنى أن كل جزيء من الكربون يرتبط مع مجموعة من جزئيات الهيدروكسيل (Hydroxyl).",
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
          image: AssetImage('assets/products/glesreen_5kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}