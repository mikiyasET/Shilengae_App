import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shilingae/blocs/values.dart';
import 'package:get/get.dart';
import 'package:shilingae/services/localizationservice.dart';

class Fpage extends StatefulWidget {
  @override
  _FpageState createState() => _FpageState();
}

class _FpageState extends State<Fpage> {
  String country = "Ethiopia";
  String _language = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Consumer<SetValues>(
            //   builder: (context, value, child) {
            //     String token;
            //     return Text("Total price: ${value.gValues()}");
            //   },
            // ),
            // FlatButton(
            //   child: Text("Add"),
            //   color: Colors.red,
            //   textColor: Colors.white,
            //   onPressed: () {
            //     Provider.of<SetValues>(context, listen: false)
            //         .SetValue('token', '21038122012');
            //   },
            // ),
            // FlatButton(
            //   child: Text("Clear"),
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   onPressed: () {
            //     Provider.of<SetValues>(context, listen: false).ClearAllValues();
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Image.asset(
                    "logo_fpage".tr,
                    height: 313.0,
                  ),
                ],
              ),
            ),

            // SizedBox(height: 5),
            /*Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: .9,
                    color: Theme.of(context).primaryColor,
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  itemHeight: 48,
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 6,
                  isExpanded: true,
                  value: country,
                  items: <String>['Ethiopia'].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (String input) {
                    setState(() {
                      country = input;
                    });
                  },
                ),
              ),
            ),*/
            // SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: .9,
                    color: Theme.of(context).primaryColor,
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 6,
                  isExpanded: true,
                  value: _language,
                  items: LocalizationService.langs.map((String lang) {
                    return DropdownMenuItem(value: lang, child: Text(lang));
                  }).toList(),
                  onChanged: (String value) {
                    // updates dropdown selected value
                    setState(() => _language = value);
                    // gets language and changes the locale
                    LocalizationService().changeLocale(value);
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            FlatButton(
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                // updates dropdown selected value
                // gets language and changes the locale
                LocalizationService().changeLocale(_language);
                Get.toNamed('/choose');
              },
              child: Text(
                "continue".tr,
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18.0,
                ),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
