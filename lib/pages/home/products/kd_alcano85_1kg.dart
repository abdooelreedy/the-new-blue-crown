import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Kd_Alcano85_1kg extends StatelessWidget {

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

  const Kd_Alcano85_1kg({
    Key? key,
    this.emptyValue = "0.07",
    this.netValue = "1",
    this.fullValue = "1.07",
    this.origin = "Egypt",
    this.type = "Viscous_Liquid",
    this.company = "ALCANO 85",
    this.concentration = "85 %",
    this.pro = "2022",
    this.exp = "2_year",
    this.price = "75.00",
    this.name = "Kd_ALCANO_85",
    this.description = "سائل اصفر أو بني مصفر ، حموضته (PH من 8 -10 ) , من  مشتقات زيت جوز الهند ، يستخدم في صناعة المنظفات ومستحضرات التجميل ومنتجات العناية بالبشرة وصبغات الشعر ومنتجات العناية بالحيوانات الأليفة .يعتبر الكمبرلان مادة فعالة سطحيا لاشاردية خافضة للتوتر السطحي ، ويعمل على زيادة الرغوة وتثبيتها كما يعمل على زيادة القوام واللزوجة وعامل مرطب للبشرة وعامل استحلاب ",
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
          image: AssetImage('assets/products/kd_alcano85_220kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}