import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = "A7A86616-9979-4FD3-8DDF-C839BB298261";
const baseURL = "https://rest.coinapi.io";

class CoinData {
  final String url;
  CoinData({this.url});

  Future getCoinData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      int status = response.statusCode;
      print('Status: $status');
    }
  }
}
