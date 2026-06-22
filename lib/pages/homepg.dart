import 'package:currency_converter_app/functions/apifunc.dart';
import 'package:currency_converter_app/modals/ratesmodel.dart';
import 'package:currency_converter_app/widgets/convertany.dart';
import 'package:currency_converter_app/widgets/usdtoany.dart';
import 'package:flutter/material.dart';

class Homepg extends StatefulWidget {
  const Homepg({super.key});

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  late Future<Map> allCurrencies;
  late Future<RatesModel> result;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allCurrencies = fetchcurrencies();
      result = fetchrates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter App',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text('No rates Data'));
                }

                return Center(
                  child: FutureBuilder<Map>(
                    future: allCurrencies,
                    builder: (context, currsnapshot) {
                      if (currsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (currsnapshot.hasError) {
                        return Center(
                          child: Text(
                            currsnapshot.error.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      if (!currsnapshot.hasData) {
                        return const Center(child: Text('No currency data'));
                      }
                      return SizedBox(
                        height: 800,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'images/pic2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 60,
                              left: 20,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 280,
                                    width: 370,
                                    child: Usdtoany(
                                      currencies: currsnapshot.data!,
                                      rates: snapshot.data!.rates,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  //
                                  //
                                  //
                                  SizedBox(
                                    height: 280,
                                    width: 370,
                                    child: Convertany(
                                      currencies: currsnapshot.data!,
                                      rates: snapshot.data!.rates,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              //
            ),
          ),
        ),
      ),
    );
  }
}
