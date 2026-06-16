// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

//will decode json from api and store it in a form of a map
Map<String, String> allCurrenciesFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allCurrenciesToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));




// we didn't wrote this code we copied the JSON response we got from
// request in /currencies.json in openexchangerates website and we pasted the json response into a website called 
//quicktype.io it took our json respose and generated this function