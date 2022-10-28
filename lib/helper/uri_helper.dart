import 'package:jobsgo/config.dart';

class UriHelper {
  static Uri getUri(content) {
    if (Config.isProductMode) {
      return Uri.https(Config.apiURL, content);
    }
    return Uri.http(Config.apiURL, content);
  }
}
