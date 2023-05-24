import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_suresi/result_page.dart';
import 'package:yasam_suresi/constans.dart';
import 'package:yasam_suresi/user_data.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double haftalikSpor = 0.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text('${haftalikSpor.round()}', style: kSayiStili),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: haftalikSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        haftalikSpor = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: kMetinStili,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${icilenSigara.round()}',
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    child: MyContainer(
                      color:
                          seciliCinsiyet == 'KADIN' ? Colors.red : Colors.white,
                      child: const IconCinsiyet(
                        cinsiyet: 'KADIN',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    child: MyContainer(
                      color:
                          seciliCinsiyet == 'ERKEK' ? Colors.red : Colors.white,
                      child: const IconCinsiyet(
                        cinsiyet: 'ERKEK',
                        icon: FontAwesomeIcons.mercury,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(0, 50),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                          kilo: kilo,
                          boy: boy,
                          seciliCinsiyet: seciliCinsiyet,
                          haftalikSpor: haftalikSpor,
                          icilenSigara: icilenSigara))));
            },
            child: Text(
              'HESAPLA',
              style: kMetinStili,
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinStili,
            )),
        const SizedBox(
          width: 10.0,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.lightBlue,
                  ),
                ),
                child: const Icon(FontAwesomeIcons.plus),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.lightBlue,
                  ),
                ),
                child: const Icon(FontAwesomeIcons.minus),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
