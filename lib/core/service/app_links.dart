import '../constData/const_date.dart';

class AppLink {
  static String req = '127.1.1.1';
  static String appRoot = 'https://';
  static String imageWithRoot = "$appRoot/storge";
  static String imageWithoutRoot = appRoot;
  static String serverApiRoot = "$appRoot/api";

  static String login = "$serverApiRoot/login";
  static String home = "$serverApiRoot/home";
  static String register = "$serverApiRoot/register";
  static String profile = "$serverApiRoot/profile";

  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'content-type': 'application/jason',
      'Accept': 'application/jason',
      'X-Requested-With': 'XMLHttpRequest'
    };
    return mainHeader;
  }

  //with token
  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'content-type': 'application/jason',
      'Accept': 'application/jason',
      'X-Requested-With': 'XMLHttpRequest',
      "Authorization": 'Bearer${ConstData.token}'
    };
    return mainHeader;
  }
}
