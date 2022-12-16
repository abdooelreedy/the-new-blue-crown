import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class TUC_lavender_700 extends StatelessWidget {

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

  const TUC_lavender_700({
    Key? key,
    this.emptyValue = "0.14",
    this.netValue = "1",
    this.fullValue = "1.14",
    this.origin = "Egypt",
    this.type = "Essential_Oil",
    this.company = "TUC",
    this.concentration = "700",
    this.pro = "2022",
    this.exp = "3_year",
    this.price = "380.00",
    this.name = "TUC LAVENDER",
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
          image: AssetImage('assets/products/TUC_lavender_700.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}