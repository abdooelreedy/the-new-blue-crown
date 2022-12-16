import 'package:flutter/cupertino.dart';

import '../../../utils/dimensions.dart';

class Butas extends StatelessWidget {

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

   const Butas({
    Key? key,
     this.emptyValue = "0.1",
     this.netValue = "25",
     this.fullValue = "25.1",
     this.origin = "Egypt",
     this.type = "Flakes",
     this.company = "El Nasr",
     this.concentration = "99 %",
     this.pro = "2022",
     this.exp = "3_year",
     this.price = "750",
     this.name = "Caustic_Soda_Flakes",
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
          image: AssetImage('assets/products/butas_25kg.png',),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}