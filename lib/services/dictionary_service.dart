import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_dictionary_app/models/kelimeler_response.dart';

class DictionaryService {
  get kelime => null;

  Future<List<String>> searchWord(String kelime) async {
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$kelime');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List<String> anlamlar = [];
      if (result[0] != null) {
        KelimelerResponse kelimelerResponse =
            KelimelerResponse.fromJson(result[0]);

        for (AnlamlarList anlam in kelimelerResponse.anlamlarList!) {
          anlamlar.add(anlam.anlam!);
        }
      }
      return anlamlar;
    }
    throw Exception('Bad Request');
  }
}
