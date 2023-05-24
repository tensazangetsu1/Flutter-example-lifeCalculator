import 'package:flutter/material.dart';
import 'package:yasam_suresi/constans.dart';
import 'package:yasam_suresi/user_data.dart';

import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  const ResultPage(this._userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuç Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(_userData).hesaplama()!.round().toString(),
              style: kMetinStili,
            )),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'GERİ DÖN',
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
