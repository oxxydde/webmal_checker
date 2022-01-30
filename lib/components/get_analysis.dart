import 'dart:convert';
import 'package:http/http.dart' as http;

import './config.dart';

Future<dynamic> getData(String url) async {
  Map<String, String>? headers = {
    'x-apikey': config['virus-total-api']['token']
  };
  Map<String, String>? formBody = {'url': url};
  
  try {
    // Submit URL for analyse
    http.Response submitResponse = await http.post(Uri.parse("https://www.virustotal.com/api/v3/urls"), headers: headers, body: formBody);

    if (submitResponse.statusCode == 200) {
      // Get analyses ID
      String analysesID = jsonDecode(submitResponse.body)['data']['id'];

      // Retrieve result
      http.Response analyseResponse = await http.get(Uri.parse("https://www.virustotal.com/api/v3/analyses/$analysesID"), headers: headers);
      dynamic finalRes = jsonDecode(analyseResponse.body)['data']['attributes'];
      if (analyseResponse.statusCode == 200) {
        while (finalRes['status'] != "completed") {
          analyseResponse = await http.get(Uri.parse("https://www.virustotal.com/api/v3/analyses/$analysesID"), headers: headers);
          finalRes = jsonDecode(analyseResponse.body)['data']['attributes'];
        }

        Map<String, int> result = {
          "safe": finalRes['stats']['harmless']! + finalRes['stats']['undetected']! + finalRes['stats']['timeout']!,
          "danger": finalRes['stats']['malicious']! + finalRes['stats']['suspicious']!
        };
        
        return result;
      }
      else {}
    }
    else {}
  }
  catch (e) {
    return e;
  }
}