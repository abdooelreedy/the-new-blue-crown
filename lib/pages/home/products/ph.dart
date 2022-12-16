import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class PH extends StatelessWidget {

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

  const PH({
    Key? key,
    this.emptyValue = "21",
    this.netValue = "2",
    this.fullValue = "41",
    this.origin = "Britain",
    this.type = "Paper",
    this.company = "Johnson",
    this.concentration = "10",
    this.pro = "2022",
    this.exp = "3_year",
    this.price = "250.00",
    this.name = "PH",
    this.description = "ورقة عباد الشمس Litmus، هي خليط قابل للذوبان في الماء من صبغات مستخلصة من الأشناتة، وخاصة روسـِلا تينكوتوريا Roccella tinctoria. عادة ما تمتص في ورق ترشيح لانتاج واحد من أقدم أشكال مؤشر الأس الهيدروجيني، تستخدم لاختبار حمضية المواد. ورق عباد الشمس الأزرق يتحول للأحمر في الظروف الحمضية وورق عباد الشمس الأحمر يتحول للأزرق في الظروف القاعدية (مثل القلويات)، ويتحدث تغير اللون في مدى الأس الهيدروجيني 4.5-8.3 عند درجة حرارة 25 °س. أوراق عباد الشمس المحايدة تكون قرمزية اللون.[1] يمكن أيضاً ان تحضر ورقة عباد الشمس كمحلول مائي يقوم بنفس الوظائف. تحت الظروف الحمضية يكون المحلول أحمر، وتحت الظروف القاعدية يكون المحلول أزرق.",
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
          image: AssetImage('assets/products/ph.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}