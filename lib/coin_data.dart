import 'dart:convert';
import 'package:http/http.dart' as http;

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

class CoinData {
  Future getPrice (var currency,var crypto) async {
    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=1C4C6146-DC50-4671-BB6A-34F4A8D55BC8');
    http.Response response =await http.get(url);
    if(response.statusCode==200){
      String data = response.body;
    return jsonDecode(data)['rate'];
    }

    else return null;
  }


}
