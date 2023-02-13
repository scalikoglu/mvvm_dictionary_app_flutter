import 'package:flutter/cupertino.dart';
import 'package:mvvm_dictionary_app/viewmodels/anlam_view_model.dart';
import 'package:mvvm_dictionary_app/widgets/secilen_kelime.dart';

class AnlamList extends StatelessWidget {
  final AnlamViewModel anlamViewModel;
  final SecilenKelime secilenKelime;

  const AnlamList(
      {super.key, required this.anlamViewModel, required this.secilenKelime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          anlamViewModel.kelime,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: anlamViewModel.anlamlar.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50, child: Text(anlamViewModel.anlamlar[index])),
            );
          },
        )
      ],
    );
  }
}
