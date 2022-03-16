// EXTERNAL PACKAGES START

import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

// EXTERNAL PACKAGES END

class menuLog {



  String formatHtmlString(String string) {
    return string
        .replaceAll("\n", "") // Line Breaks
        .trim(); // Whitespace
  }

    void getData() async {

    String method = '3004-melbourne?lat=-37.8210149&long=144.9765164';
    final dealsURL = 'https://www.menulog.com.au/area/$method';

    final response = await get(Uri.parse(dealsURL));

    final body = response.body;
    final html = parse(body);

    List<Element> restNames = html.querySelectorAll('h3');

    restNames.asMap().forEach((index, restName) async {
      print('${formatHtmlString(restName.text)}, $index');
    });
  }

}