import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class TAKASAG_LEMON extends StatelessWidget {

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

  const TAKASAG_LEMON({
    Key? key,
    this.emptyValue = "0.133",
    this.netValue = "1",
    this.fullValue = "1.13",
    this.origin = "Egypt",
    this.type = "Essential_Oil",
    this.company = "VENUS CHEMICALS",
    this.concentration = "",
    this.pro = "2021",
    this.exp = "2_year",
    this.price = "350.00",
    this.name = "TAKASAGO_LEMON",
    this.description = "الزيوت العطرية أو الزيوت الطيارة هي مستخلصات زيتية سهلة التطاير يحصل عليها من النباتات أو أجزاء منها، تتميز بأن لها رائحتها الفواحة مثل زيت القرنفل.على العكس من الزيوت الدهنية فإن الزيوت العطرية تتبخر بشكل كامل ولا تترك أي أثر خلفها. تتكون الزيوت العطرية من العديد من المكونات المختلفة، وهي منحلة في الدهون على الرغم من أنها لا تحوي أي مكونات دهنية. انحلالية هذه الزيوت في الماء ضعيفة، وتشكل قطيرات سائلة تطفو على السطح لأنها أقل كثافة من الماء.",
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
          image: AssetImage('assets/products/TAKASAG_LEMON.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}