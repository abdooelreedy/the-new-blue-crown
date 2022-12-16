import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Pb4_Premofor_5kg extends StatelessWidget {

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

  const Pb4_Premofor_5kg({
    Key? key,
    this.emptyValue = "0.094",
    this.netValue = "5",
    this.fullValue = "5.094",
    this.origin = "Malaysia",
    this.type = "Liquid",
    this.company = "Premofor® B20",
    this.concentration = "35 %",
    this.pro = "2021",
    this.exp = "2_year",
    this.price = "325.00",
    this.name = "Premofor_Betaine",
    this.description = "ويسمى بالأمفوتيريك (Amphoteric)  حيث يعتبر البيتائين من المواد الفعالة سطحيا المذبذبة المتوسطة القوة أي يملك صفات أمفوتيرية حيث ان بنيته الكيميائية سلسلة هيدروكربونية طويلة بالاضافة إلى كاتيون الامونيوم الرباعي موجب الشحنة NH4+  ومجموعة الكريوكسيل -COO سالبة الشحنة .",
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
          image: AssetImage('assets/products/pb4_premofor_5kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}