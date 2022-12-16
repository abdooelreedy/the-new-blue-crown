import 'package:flutter/cupertino.dart';
import '../../../utils/dimensions.dart';

class Texapon_Malaysia_160Kg extends StatelessWidget {

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

  const Texapon_Malaysia_160Kg({
    Key? key,
    this.emptyValue = "7",
    this.netValue = "160",
    this.fullValue = "167",
    this.origin = "Malaysia",
    this.type = "Gel",
    this.company = "Aman Chem",
    this.concentration = "70 %",
    this.pro = "2022",
    this.exp = "1_year",
    this.price = "8640",
    this.name = "Texapon_Malaysia",
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
          image: AssetImage('assets/products/texapon_Malaysia_160kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}