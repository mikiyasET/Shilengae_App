import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Fpage extends StatefulWidget {
  @override
  _FpageState createState() => _FpageState();
}

class _FpageState extends State<Fpage> {
  String country = "Ethiopia";
  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Image.asset("logo_fpage".tr().toString()),
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
                  value: language,
                  items:
                      <String>['English', 'አማርኛ'].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (String input) {
                    language = input;
                    if (language == "አማርኛ") {
                      setState(() {
                        EasyLocalization.of(context).locale =
                            Locale('am', 'AM');
                      });
                    } else if (language == "English") {
                      setState(() {
                        EasyLocalization.of(context).locale =
                            Locale('en', 'EN');
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            FlatButton(
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                if (language == "English") {
                  setState(() {
                    EasyLocalization.of(context).locale = Locale('en', 'EN');
                  });
                } else if (language == "አማርኛ") {
                  setState(() {
                    EasyLocalization.of(context).locale = Locale('am', 'AM');
                  });
                }
                Navigator.pushNamed(context, '/choose');
              },
              child: Text(
                "continue".tr().toString(),
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
