import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class IsaretDili extends StatelessWidget {
  final String kelime;
  const IsaretDili({super.key, required this.kelime});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: height * 0.12,
            width: width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: kelime.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 88,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Image.network(
                                    'https://sozluk.gov.tr/assets/img/isaret/a.gif')),
                          ),
                        ),
                        Text(
                          kelime[index].toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
