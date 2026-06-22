import 'package:currency_converter_app/functions/apifunc.dart';
import 'package:flutter/material.dart';

class Convertany extends StatefulWidget {
  final rates;
  final Map currencies;
  const Convertany({super.key, required this.currencies, required this.rates});

  @override
  State<Convertany> createState() => _ConvertanyState();
}

class _ConvertanyState extends State<Convertany> {
  TextEditingController amountcontroller = TextEditingController();
  String dropdownVal1 = 'AUD';
  String dropdownVal2 = 'AUD';
  String ans = 'Converted Value will Show here : ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Convert Any Currency',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 330,
                height: 50,
                child: TextFormField(
                  controller: amountcontroller,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownVal1,
                      icon: Icon(Icons.arrow_drop_down),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      iconSize: 20,
                      elevation: 10,
                      isExpanded: true,
                      underline: Container(height: 2, color: Colors.grey),
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          dropdownVal1 = newVal!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('to', style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownVal2,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      elevation: 10,
                      isExpanded: true,
                      underline: Container(height: 2, color: Colors.grey),
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                          .toList(),
                      onChanged: (String? newVAL) {
                        setState(() {
                          dropdownVal2 = newVAL!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  setState(() {
                    ans =
                        '${amountcontroller.text} $dropdownVal1 ${convertANY(
                          widget.rates,
                          amountcontroller.text,
                          dropdownVal1,
                          dropdownVal2,
                        )} $dropdownVal2';
                  });
                },
                child: Text(
                  'Convert',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                ans,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
