import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getPreferenceId({title, description, quantity, currency_id, unit_price, email}) async {
  var url = Uri.parse(
    'https://api.mercadopago.com/checkout/preferences?access_token=TEST-5457382658531713-091501-bfe09c442e0fbcca898d2228ff132d0c-66513246'
  );

  Map<String, dynamic> corpoJson = {
    "items": [
      {
        "title": title,
        "description": description,
        "quantity": quantity,
        "currency_id": currency_id,
        "unit_price": unit_price
      }
    ],
    "payer": {
      "email": email
    }
  };

  String corpoString = jsonEncode(corpoJson);

  var response = await http.post(
      url,
      body: corpoString);

  var finalResponseId = jsonDecode(response.body);
  var preferenceId = finalResponseId['id'];

  print('Status Response: ${response.statusCode}');
  print('preferenceId: ${preferenceId}');

  return preferenceId;
}