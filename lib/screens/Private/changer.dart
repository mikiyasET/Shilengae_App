import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shilingae/services/localizationservice.dart';

class ChangeEveryThing extends StatefulWidget {
  final String title;
  final int page;
  ChangeEveryThing({this.title, this.page});
  @override
  _ChangeEveryThingState createState() => _ChangeEveryThingState();
}

class _ChangeEveryThingState extends State<ChangeEveryThing> {
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  bool _showPassword3 = false;
  @override
  Widget build(BuildContext context) {
    Widget _EmailAddress() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            style: TextStyle(
              fontSize: 17,
              height: 1.3,
              fontWeight: FontWeight.w700,
            ),
            cursorColor: Colors.teal,
            keyboardType: TextInputType.emailAddress,
            scrollPadding: EdgeInsets.only(left: 40.0),
            decoration: InputDecoration(
              labelText: 'New Email Address'.tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: .6,
              ),
              border: UnderlineInputBorder(
                  borderSide:
                      new BorderSide(color: Theme.of(context).dividerColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      new BorderSide(color: Theme.of(context).dividerColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      new BorderSide(color: Theme.of(context).primaryColor)),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: FlatButton(
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: Text(
                "Save".tr,
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18.0,
                ),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    }

    Widget _ChangePassword() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword1 ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'Old password'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword2 ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'New password'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            setState(() {
                              _showPassword2 = !_showPassword2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword3 ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'Confirm password'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword3
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            setState(() {
                              _showPassword3 = !_showPassword3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: FlatButton(
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: Text(
                "Save".tr,
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18.0,
                ),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    }

    Widget _ChangeLanguage() {
      return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.updateLocale(LocalizationService.locales[index]);
              print('name'.tr);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: LocalizationService.locales[index] == Get.locale
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textSelectionColor,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[400], width: 1))),
              padding: EdgeInsets.all(25),
              child: Text(
                LocalizationService.langs[index].toString(),
                style: TextStyle(
                  color: LocalizationService.locales[index] == Get.locale
                      ? Theme.of(context).textSelectionColor
                      : Theme.of(context).secondaryHeaderColor,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
        itemCount: 2,
      );
    }

    Widget _ChangePhone() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "mobileNumber".tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                ),
                child: IntlPhoneField(
                  onSubmitted: (ass) {
                    print("ssdsooo");
                  },
                  onSaved: (val) {
                    print("hooo");
                  },
                  onTap: () {
                    print("hi");
                  },
                  onCountry: (value) {
                    print(value);
                    //phoneController.clear();
                    //phoneNode.requestFocus();
                  },
                  // focusNode: phoneNode,
                  maxLength: 12,
                  // controller: phoneController,
                  showDropdownIcon: false,
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    print("changed");
                    // countrycode = phone.countryCode;
                  },
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: FlatButton(
              height: 55,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              child: Text(
                "Save".tr,
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18.0,
                ),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    }

    Widget _TermAndCondition() {
      // return FutureBuilder(
      //   future: http.get("https://test.shilenga.com/api/terms-conditions"),
      //   // return response;,
      //   builder: (context, snapshots) {
      //     return Stack(
      //       children: [
      //         false
      //             ? CircularProgressIndicator()
      //             : Container(
      //                 child: Flex(
      //                   direction: Axis.vertical,
      //                   children: [
      //                     Expanded(child: Text(snapshots.data.toString())),
      //                   ],
      //                 ),
      //               ),
      //       ],
      //     );
      //   },
      // );
    }
    // Widget _ChangePassword() {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
    //         child: FlatButton(
    //           height: 55,
    //           minWidth: MediaQuery.of(context).size.width,
    //           onPressed: () {},
    //           child: Text(
    //             "Save".tr,
    //             style: TextStyle(
    //               color: Theme.of(context).textSelectionColor,
    //               fontSize: 18.0,
    //             ),
    //           ),
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       ),
    //     ],
    //   );
    // }

    Widget _selectedWidget;
    switch (widget.page) {
      case 1:
        _selectedWidget = Padding(
            padding: const EdgeInsets.all(15.0), child: _ChangePassword());
        break;
      case 3:
        _selectedWidget = _ChangeLanguage();
        break;
      case 4:
        _selectedWidget =
            Padding(padding: const EdgeInsets.all(15.0), child: _ChangePhone());
        break;
      case 5:
        _selectedWidget = Padding(
            padding: const EdgeInsets.all(15.0), child: _EmailAddress());
        break;
      case 6:
        _selectedWidget = _TermAndCondition();
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
    }
    print(widget.title);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
      ),
      body: _selectedWidget,
    );
  }
}
