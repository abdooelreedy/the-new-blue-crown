import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Semasol_Dow_213kg extends StatelessWidget {

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

  const Semasol_Dow_213kg({
    Key? key,
    this.emptyValue = "10 كجم",
    this.netValue = "213.13 كجم",
    this.fullValue = "223.13 كجم",
    this.origin = "أمريكا",
    this.type = "سائل لزج",
    this.company = "DOW",
    this.concentration = "",
    this.pro = "2021",
    this.exp = "سنتين",
    this.price = "26625.00",
    this.name = "سيماسول داو",
    this.description = "السيماسول سائل لزج أصفر خفيف برائحة فينولية.السيماسول مادة فعالة سطحياً خافضة للتوتر السطحي غير أيونية.السيماسول مادة إقتصادية جداً وبتؤدي جميع المهام بتاعتها على أكمل وجه.بتدخل فى تطبيقات كتيرة زي صناعة المنظفات والدهانات والمبيدات",
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
          image: AssetImage('assets/products/semasol_dow_213kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}