import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好 世界',
          "changeToCN":"切换至汉语",
          "changeToUS":"切换至英语"
        },
        'en_US': {
          'hello': 'Hallo Welt',
          "changeToCN":"change to CN",
          "changeToUS":"change to US"
        }
      };
}
