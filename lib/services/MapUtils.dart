import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/hospitals nearby';
    try {

      await launch(googleUrl);

    }
    catch (err) {
      throw (err.toString());
    }
  }

}

