import 'package:flutter/material.dart';
import 'package:mvvm_dictionary_app/viewmodels/anlam_list_view_model.dart';
import 'package:mvvm_dictionary_app/widgets/anlam_list.dart';
import 'package:mvvm_dictionary_app/widgets/isaret_dili.dart';
import 'package:provider/provider.dart';

class AnlamListPage extends StatefulWidget {
  const AnlamListPage({super.key});

  @override
  State<AnlamListPage> createState() => _AnlamListPageState();
}

class _AnlamListPageState extends State<AnlamListPage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AnlamListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelime Anlam'),
      ),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.orange[50]),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Türkçe Sözlükte Ara',
                      suffixIcon: InkWell(
                        child: const Icon(Icons.search),
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            viewModel.getAnlam(_controller.text);
                          }
                        },
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    controller: _controller,
                  ),
                ),
              ),
              getWidgetByStatus(viewModel)
            ],
          )),
    );
  }

  getWidgetByStatus(AnlamListViewModel viewModel) {
    switch (viewModel.status.index) {
      case 1:
        return Center(
          child: SizedBox(
              child: CircularProgressIndicator(), height: 50, width: 50),
        );
      case 2:
        return const Text(
          'Sonuç Bulunamadı',
          style: TextStyle(fontSize: 18),
        );
      default:
        return AnlamList(
          anlamViewModel: viewModel.anlamViewModel,
          isaretDili: IsaretDili(
            kelime: viewModel.anlamViewModel.kelime,
          ),
        );
    }
  }
}
