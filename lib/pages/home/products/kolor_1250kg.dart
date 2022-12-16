import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Kolor_1250kg extends StatelessWidget {

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

  const Kolor_1250kg({
    Key? key,
    this.emptyValue = "20",
    this.netValue = "1250",
    this.fullValue = "1270",
    this.origin = "Egypt",
    this.type = "Liquid",
    this.company = "Bor_Saed",
    this.concentration = "14 %",
    this.pro = "2022",
    this.exp = "6_Months",
    this.price = "3750.00",
    this.name = "Bor_Saed_Color",
    this.description = "الكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريك . يعرف عادة باسم المبيض عند إذابته في الماء .في الواقع هبيوكلرويت الصوديوم يختلف عملياً وكيميائياً عن الكلور . يستخدم مركب هيبوكلوريت الصوديوم كمطهر أو كعامل مبيّض . ويكيبيديايأتي الكلور السائل علي هيئة سائل تركيز يتراوح من 12% إلي 15%، ويتم تمديدة بالماء ليصل لنسبة 5%.كيفية حساب كمية الماء المضافة للكلور المركزيتم إستخدام قانون التخفيف التالي( التركيز × الحجم ) قبل التتخفيف = ( التركيز × الحجم ) بعد التخفيفومثلا إذا كان لدينا 10 لتر كلور مركز تركيز 15% وأردنا الحصول على كلور تركيز 5%، فما هي نسبة الماء المضاف ؟بالتعويض فى المعادلة السابقة ( 15% × 10) قبل التتخفيف = ( 5% × الحجم ) بعد التخفيفالحجم بعد التخفيف= ( 15 × 10) / 5 = 30 لتر. إذا سيتم إضافة 20 لتر ماء لكل 10 لتر كلور تركيز 15% للحصول على كلور سائل تركيز 5%.",
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
          image: AssetImage('assets/products/tank.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}