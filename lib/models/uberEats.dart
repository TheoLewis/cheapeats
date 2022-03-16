// EXTERNAL PACKAGES START

import 'package:http/http.dart';
import 'package:html/parser.dart';

// EXTERNAL PACKAGES END

class uberEats {

  final dealsURL = 'https://www.ubereats.com/deals';

  void getData() async {
    final response = await get(Uri.parse(dealsURL));

    final body = response.body;
    final html = parse(body);

    final restName = html.querySelector('h3')?.text;
    //print("Restaurant Name: $restName");
  }

}