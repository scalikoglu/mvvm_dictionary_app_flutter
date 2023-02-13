import 'package:flutter/cupertino.dart';
import 'package:mvvm_dictionary_app/services/dictionary_service.dart';
import 'package:mvvm_dictionary_app/viewmodels/anlam_view_model.dart';

enum Status { initial, loading, notfound, success }

class AnlamListViewModel extends ChangeNotifier {
  AnlamViewModel anlamViewModel = AnlamViewModel('', []);
  Status status = Status.initial;

  Future<void> getAnlam(String kelime) async {
    List<String> anlam = await DictionaryService().searchWord(kelime);
    anlamViewModel = AnlamViewModel(kelime, anlam);
    status = anlam.isNotEmpty ? Status.success : Status.notfound;
    notifyListeners();
  }
}
