import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Aagena_1kg extends StatelessWidget {

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

  const Aagena_1kg({
    Key? key,
    this.emptyValue = "0.07",
    this.netValue = "1",
    this.fullValue = "1.07",
    this.origin = "France",
    this.type = "Liquid",
    this.company = "Venus Chemicals Group",
    this.concentration = "80 %",
    this.pro = "2022",
    this.exp = "1_year",
    this.price = "90.00",
    this.name = "VENOTHICK_FT_12",
    this.description = "تساعد على تطرية ممتازة وتخفف من الكهرباء الساكنة اقل سمية واقل تخريش من مركبات الامونيوم الرباعية , مجال الاستخدام:مطريات الغسيل",
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
          image: AssetImage('assets/products/3agena_1kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}