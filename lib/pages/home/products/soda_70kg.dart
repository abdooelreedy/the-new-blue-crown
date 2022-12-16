import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Soda_70kg extends StatelessWidget {

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

  const Soda_70kg({
    Key? key,
    this.emptyValue = "3",
    this.netValue = "80",
    this.fullValue = "83",
    this.origin = "Egypt",
    this.type = "Liquid",
    this.company = "El Nasr",
    this.concentration = "48 %",
    this.pro = "2022",
    this.exp = "3_year",
    this.price = "1550",
    this.name = "liquid_Caustic_Soda",
    this.description = "يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريكالكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريكالكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريكالكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريكالكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريكالكلور هيبو كلوريت الصوديوم هو مركب كيميائي صيغته الكيميائية NaClO , يتكون من كاتيون ( أيون ذوشحنة موجبة) +Na و أيون سالب -ClO، ويمكن أن يصنف أيضاً كأحد أملاح الصوديوم لحمض الهيبوكلوريك",
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
          image: AssetImage('assets/products/gmdana.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}