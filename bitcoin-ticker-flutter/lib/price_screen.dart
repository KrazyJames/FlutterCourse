import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'reusable_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  var rates = {};

  @override
  void initState() {
    super.initState();
    fillRates();
    updateUI(selectedCurrency);
  }

  void fillRates(){
    for (String crypto in cryptoList){
      rates[crypto] = 0.0;
    }
  }

  void updateUI(String currency) async {
    for (String crypto in cryptoList) {
      CoinData coinData = CoinData(
          url: '$baseURL/v1/exchangerate/$crypto/$currency?apikey=$apiKey');
      dynamic jsonData = await coinData.getCoinData();
      if (jsonData != null) {
        setState(() {
          rates[crypto] = jsonData["rate"];
        });
      } else {
        print("Null response");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          cardList(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                Platform.isIOS ? getCupertinoPicker() : getMaterialDropdown(),
          ),
        ],
      ),
    );
  }

  Widget cardList() {
    List<Widget> cards = [];
    for (String crypto in cryptoList) {
      var card = ReusableCard(
        crypto: crypto,
        rate: rates[crypto],
        currency: selectedCurrency,
      );
      cards.add(card);
    }
    return Column(
      children: cards,
    );
  }

  //For MaterialUI
  DropdownButton<String> getMaterialDropdown() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      var menuItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      items.add(menuItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updateUI(selectedCurrency);
        });
      },
    );
  }

  //For CupertinoUI
  CupertinoPicker getCupertinoPicker() {
    List<Widget> items = [];
    for (String currency in currenciesList) {
      var item = Text(currency);
      items.add(item);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: items,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currenciesList[index];
          updateUI(selectedCurrency);
        });
      },
    );
  }

}
