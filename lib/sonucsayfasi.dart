import 'package:flutter/material.dart';
import 'package:yasamendeksi/degerler.dart';

class SonucSayfasi extends StatelessWidget {
  final Degerler _degerler;
  SonucSayfasi(this._degerler);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fatih")),
      body: Column(
        children: [
          Expanded(
            flex:12,
            child: Column(children: [
              Text(_degerler.kilo.toString()),
              Text(_degerler.boy.toString()),
              Text(_degerler.icilensigara.round().toString()),
              Text(_degerler.sporsayisi.round().toString()),
              Text(_degerler.secilencinsiyet)
            ],)
            
          ),
          Expanded(
            flex: 1,
            child: ButtonTheme(
              height: 50,
              minWidth: double.infinity,
              child: FlatButton(
                color: Colors.white,
                child: Text("Geri Dön"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
