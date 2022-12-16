import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Mosadf_1kg extends StatelessWidget {

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

  const Mosadf_1kg({
    Key? key,
    this.emptyValue = "70",
    this.netValue = "1",
    this.fullValue = "1.07",
    this.origin = "France",
    this.type = "Viscous_Liquid",
    this.company = "فينوثيك",
    this.concentration = "80 %",
    this.pro = "2021",
    this.exp = "2_year",
    this.price = "90.00",
    this.name = "Mosadf",
    this.description = "",
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
          image: AssetImage('assets/products/mosadf_1kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}