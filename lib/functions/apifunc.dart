import 'package:currency_converter_app/modals/jsonmodel.dart';
import 'package:currency_converter_app/modals/ratesmodel.dart';
import 'package:currency_converter_app/utils/api.dart';
import 'package:http/http.dart' as http;

Future<Map> fetchcurrencies() async {
  var response = await http.get(
    Uri.parse('https://openexchangerates.org/api/currencies.json'),
  );
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

Future<RatesModel> fetchrates() async {
  var response = await http.get(
    Uri.parse('https://openexchangerates.org/api/latest.json?app_id=$key'),
  );
  final result = ratesModelFromJson(response.body);
  return result;
}

// what does exchnageRates[currency] mean? = suppose user chose AED as currency now our map gives us (AED: 3.672538), here we are acessing the 3.672538 of currency AED, same for all currencies
// after getting currency value we are simply * it with USD val
String convertUSD(Map exchangeRates, String USD, String Currency) {
  String output = ((exchangeRates[Currency] * double.parse(USD)).toString())
      .toString();
  return output;
}

String convertANY(
  Map exchnagerates,
  String USD,
  String currencybase,
  String currencyFinal,
) {
  String output =
      (double.parse(USD) /
              exchnagerates[currencybase] *
              exchnagerates[currencyFinal])
          .toStringAsFixed(2)
          .toString();
  return output;
}
