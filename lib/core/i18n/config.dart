import 'package:get/get.dart';

import 'en_US.dart';
import 'tr-TR.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': TR_TR,
        'en_US': EN_US,
      };
}
