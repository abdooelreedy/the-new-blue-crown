import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Brmel_160kg extends StatelessWidget {

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

  const Brmel_160kg({
    Key? key,
    this.emptyValue = "",
    this.netValue = "",
    this.fullValue = "",
    this.origin = "",
    this.type = "",
    this.company = "",
    this.concentration = "",
    this.pro = "",
    this.exp = "",
    this.price = "",
    this.name = "",
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
          image: AssetImage('assets/products/brmel_160kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}