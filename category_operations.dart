import 'package:flutter_application_1/models/category.dart';

class CategoryOperations {
   CategoryOperations._() {}
  static List<category> getCategories() {
    return <category>[
       category('Top Songs','https://i.pinimg.com/564x/b7/b8/15/b7b8153ab33b887e50896019ddae3be5.jpg'
          ),
          category('Imaginary Dragons','https://i.pinimg.com/564x/b0/a7/18/b0a71803417cfe26a860d60fded64b3e.jpg'
          ),
          category('Arijit Singh','https://c-fa.cdn.smule.com/rs-s-sf-1/arr/0f/3e/33a8303b-96c8-4310-8969-534667cc930f.jpg'
          ),
          category('Best of April','https://styles.redditmedia.com/t5_2yhyd/styles/communityIcon_sswd1xa93izb1.png'
          ),
          category('Popular 90s','https://a.wattpad.com/useravatar/MichaelJacksonfan178.256.213406.jpg'
          ),
          category('Punjabi Hits','https://i.pinimg.com/736x/37/e6/b2/37e6b2e5aa8324797203118d2c162286.jpg'
          ),
    ];
  }
}
