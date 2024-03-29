import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shilingae/services/localizationservice.dart';

class Fpage extends StatefulWidget {
  @override
  _FpageState createState() => _FpageState();
}

class _FpageState extends State<Fpage> {
  String country = "Ethiopia";
  String? _language = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: MediaQuery.of(context).size.height / 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Image.asset(
                      "logo_fpage".tr,
                      height: 280.0,
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
                    onChanged: (String? value) {
                      // updates dropdown selected value
                      setState(() => _language = value);
                      // gets language and changes the locale
                      LocalizationService().changeLocale(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
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
                    color: Theme.of(context)
                        .textSelectionTheme
                        .selectionHandleColor,
                    fontSize: 18.0,
                  ),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
