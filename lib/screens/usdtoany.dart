import 'package:currency_converter_app/functions/apifunc.dart';
import 'package:flutter/material.dart';

class Usdtoany extends StatefulWidget {
  final rates;
  final Map currencies;
  const Usdtoany({super.key, required this.rates, required this.currencies});

  @override
  State<Usdtoany> createState() => _UsdtoanyState();
}

class _UsdtoanyState extends State<Usdtoany> {
  TextEditingController usdcontroller = TextEditingController();
  String dropdownvalue = 'AUD';
  String ans = 'Converted Currency Will be Shown Here :)';
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'USD To Any Currency',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 330,
              height: 50,
              child: TextFormField(
                key: ValueKey('USD'),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                controller: usdcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter USD',
                  hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                    value: dropdownvalue, // will show default val of AUD
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 30,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    elevation: 10,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade100,
                    ),

                    //widget.currencies is a Map, bu doing .keys we are accessing only keys part pf the map
                    // then we do .toSet() this allows us to nnot get similar or multiple val,
                    //then .toList() and we converted it to a list,
                    //then we return Dropdownmenuitem so bascically all the value of keys will now be shown in the dropdownbutton
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
                        dropdownvalue =
                            newVal!; //AUD (Default value will be updated) by the value we select
                      });
                    },
                  ),
                ),

                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  // widget.rates = all the rates we are getting from API
                  //usdcontroller.text = what user wrote inside the textfield
                  //dropdownval what val we selected inside our dropdown button
                  onPressed: () {
                    setState(() {
                      ans =
                          usdcontroller.text +
                          'USD =' +
                          convertUSD(
                            widget.rates,
                            usdcontroller.text,
                            dropdownvalue,
                          ) +
                          ' ' +
                          dropdownvalue;
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
              ],
            ),
            SizedBox(height: 30),
            Text(
              ans,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
