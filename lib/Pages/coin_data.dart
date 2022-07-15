import 'dart:convert';
//import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'Content writing',
  //'app developer'
  'Cad designer',
  'Artist',
  //'Accountant',
  //'Financial advisor',
  'App developer',
  'Web developer',
  'Graphic designing',
  'Nutritionist',
  'Editor',
  'Mental wellness coach',
  //'Legal advisor',
  //'Architect',
  //'Share market analyst',
  'Data analyst',
  'Ethical hacker',
  'Music programmer',
  'Lyricist',
  'Influencer',
  'Pianist',
  //'Aerospace engineer',
  'Event management',
  'Click here',
  //'Content Writer',
  'Social media manager',
  'Photographer',
  'content writer'


];

const List<String> LevelList = [

  'Beginner',
  'Intermediate',
  'professional',
  'Click Here ',

];

// const List<String> SearchList = [
//
//   'Content writing',
//   //'app developer'
//   'Cad designer',
//   'Artist',
//   //'Accountant',
//   //'Financial advisor',
//   'App developer',
//   'Web developer',
//   'Graphic designing',
//   'Nutritionist',
//   'Editor',
//   'Counsellor',
//   //'Legal advisor',
//   //'Architect',
//   //'Share market analyst',
//   'Data analyst',
//   'Ethical hacker',
//   'Music programmer',
//   'Lyricist',
//   'Influencer',
//   'pianist',
//   //'Aerospace engineer',
//   'Event management',
//   //'Click here',
//   //'Content Writer'
//
//
// ];
//

// const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];
//
// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = 'YOUR-API-KEY-HERE';

// class CoinData {
//   Future getCoinData(String selectedCurrency) async {
//     Map<String, String> cryptoPrices = {};
//     for (String crypto in cryptoList) {
//       String requestURL =
//           '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
//       http.Response response = await http.get(requestURL);
//       if (response.statusCode == 200) {
//         var decodedData = jsonDecode(response.body);
//         double price = decodedData['rate'];
//         cryptoPrices[crypto] = price.toStringAsFixed(0);
//       } else {
//         print(response.statusCode);
//         throw 'Problem with the get request';
//       }
//     }
//     return cryptoPrices;
//   }
//}
