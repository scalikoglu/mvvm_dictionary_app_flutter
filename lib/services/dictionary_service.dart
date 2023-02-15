import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_dictionary_app/models/kelimeler_response.dart';
import 'dart:io';

import 'app_exception.dart';

class DictionaryService {
  Future<List<String>> searchWord(String kelime) async {
    Uri url = Uri.parse('https://www.sozluk.gov.tr/gts?ara=köpek');
    dynamic responseJson;
    try {
      final response =
          await http.get((url), headers: {'Content-type': 'application/json'});
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
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
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
