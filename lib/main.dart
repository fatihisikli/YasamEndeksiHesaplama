import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamendeksi/sonucsayfasi.dart';

import 'degerler.dart';
import 'icon_cinsiyet.dart';
import 'icon_cont.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlue),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String secilencinsiyet;
  double icilensigara = 0.0;
  double sporsayisi = 3;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                    child: rowboy("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: rowboy("KILO"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz ?",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Text(
                    sporsayisi.round().toString(),
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  Slider(
                      min: 0,
                      max: 20,
                      value: sporsayisi,
                      onChanged: (double value) {
                        setState(() {
                          sporsayisi = value;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz ?",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Text(
                    icilensigara.round().toString(),
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  Slider(
                      min: 0,
                      max: 30,
                      value: icilensigara,
                      onChanged: (double value) {
                        setState(() {
                          icilensigara = value;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilencinsiyet = "Kadın";
                        print(secilencinsiyet);
                      });
                    },
                    renk: secilencinsiyet == "Kadın"
                        ? Colors.pink[200]
                        : Colors.white,
                    child: CinsiyetCard(
                      cinsiyet: "Kadın",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilencinsiyet = "Erkek";
                        print(secilencinsiyet);
                      });
                    },
                    renk: secilencinsiyet == "Erkek"
                        ? Colors.lightBlue[200]
                        : Colors.white,
                    child: CinsiyetCard(
                      cinsiyet: "Erkek",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              color: Colors.white,
              child: Text("Hesapla"),
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) {
                  return SonucSayfasi(Degerler(
                    icilensigara: icilensigara,
                    kilo: kilo,
                    secilencinsiyet: secilencinsiyet,
                    boy: boy,
                    sporsayisi: sporsayisi,
                  ));
                });
                Navigator.push(context, route);
              },
            ),
          )
        ],
      ),
    );
  }

  Row rowboy(String degisken) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(degisken,
                style: TextStyle(fontSize: 20, color: Colors.black54))),
        RotatedBox(
            quarterTurns: 3,
            child: Text(degisken == "BOY" ? boy.toString() : kilo.toString(),
                style: TextStyle(fontSize: 30, color: Colors.blue))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 7,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    degisken == "BOY" ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 7,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    degisken == "BOY" ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
