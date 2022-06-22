import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/required.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int btc;
  int eth;
  int ltc;
  bool load =true;


  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> a = [];
    for (int i = 0; i < currenciesList.length; i++) {
      a.add(DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      ));
    }
    return DropdownButton<String>(
      value: '$selectedCurrency',
      items: a,
      onChanged: (value) async{
        CoinData coinData=new CoinData();
        btc=(await coinData.getPrice(selectedCurrency,'BTC')).toInt();
        eth=(await coinData.getPrice(selectedCurrency,'ETH')).toInt();
        ltc=(await coinData.getPrice(selectedCurrency,'LTC')).toInt();
        setState(()  {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iosDropdown() {
    List<Widget> a = [];
    for (int i = 0; i < currenciesList.length; i++) {
      a.add(Text(currenciesList[i]));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async{
        CoinData coinData=new CoinData();
        btc=(await coinData.getPrice(selectedCurrency,'BTC')).toInt();
        eth=(await coinData.getPrice(selectedCurrency,'ETH')).toInt();
        ltc=(await coinData.getPrice(selectedCurrency,'LTC')).toInt();
        setState(()  {

        });
      },
      children: a,
    );
  }
@override
  void initState() {
    getPrice();
    super.initState();
  }

  void getPrice() async{
    CoinData coinData=new CoinData();
    btc=(await coinData.getPrice(selectedCurrency,'BTC')).toInt();
    eth=(await coinData.getPrice(selectedCurrency,'ETH')).toInt();
    ltc=(await coinData.getPrice(selectedCurrency,'LTC')).toInt();
    setState((){
      load=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            coinType(btc, selectedCurrency,'BTC',true),
            coinType(eth, selectedCurrency,'ETH',false),
            coinType(ltc, selectedCurrency,'LTC',false),
            Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isIOS?iosDropdown():androidDropdown()),
          ],
        ),
      ),
    );
  }
}

