import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Texapon_Galaxy_5kg extends StatelessWidget {

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

  const Texapon_Galaxy_5kg({
    Key? key,
    this.emptyValue = "94",
    this.netValue = "5",
    this.fullValue = "5.094",
    this.origin = "Malaysia",
    this.type = "Gel",
    this.company = "Malaysia",
    this.concentration = "70 %",
    this.pro = "2022",
    this.exp = "2_year",
    this.price = "310.00",
    this.name = "Texapon_Galaxy",
    this.description = "    كبريتات لوريل الصوديوم هو مركب كيميائي أيوني، وهو مؤثر سطحي يستخدم في الصابون السائل والشامبو يسمى تجاريا التكسابون نظرا لقدرته على تشكيل الرغوة .. ومن خواصه انه مادة خافضة للتوتر السطحي وله قدرة عالية على إعطاء الرغوة اللازمة للتنظيف و له القدرة على ازالة الزيوت والأوساخ بفعالية عالية. إضافة إلى كونه رخيص الثمن مما يجعل استعماله واسع الانتشار",
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
          image: AssetImage('assets/products/texapon_galaxy_5kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}