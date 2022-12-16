import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';

class Red_Color extends StatelessWidget {

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

  const Red_Color({
    Key? key,
    this.emptyValue = "0.04",
    this.netValue = "1",
    this.fullValue = "1.04",
    this.origin = "Egypt",
    this.type = "Powder",
    this.company = "Delta_Aromatic",
    this.concentration = "25 %",
    this.pro = "2021",
    this.exp = "3_year",
    this.price = "110.00",
    this.name = "Delta_Red_Color",
    this.description = "يعتمد تصنيعها على التفاعل مع قطران الفحم أيضاً، والتي بدروها نجحت بالفعل فأُنشئت بناءً عليه مصانع عدّة مُخصصة لإنتاجها في مُختلف الدول، حيث صُنعت العديد من الألوان بسعرٍ أقل كلفة بكثير من الطرق الأوليّة لاستخراجها والتي اعتمدت على المواد والعناصر الطبيعيّة، إضافةً لدخولها في مجال الطب أيضاً، حيث دخلت الأصباغ في تجربة قتل البكتيريا من خلال الشرائح المجهريّة الملوّنة التي استخدمها الأطباء لهذه الغاية، لتُثبت نجاحها بكفاءة، وهنا استُخدمت بدورها لصُنع المُضادات والأدوية الطبيّة، الأمر الذي أحدث ثورة أخرى في مجال تصنيع واستخدام هذه الألوان وزيادة فرص الاستفادة منها في النسيج، والطب، وتلوين الصناعات البلاستيكيّة، والمُنتجات الأخرى التي اشتهرت في وقتنا الحاضر.",
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
      width: Dimensions.width30 * 10,
      height: Dimensions.height45 * 8,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/products/red_color.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}