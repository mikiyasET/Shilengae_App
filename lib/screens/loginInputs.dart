import 'package:flutter/gestures.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shilingae/blocs/loginbloc.dart';
import 'package:get/get.dart';

class LoginInputs extends StatefulWidget {
  @override
  _LoginInputsState createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  bool _showPassword = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String countrycode;
  // final login = LoginBloc();
  FocusNode phoneNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              phoneController.clear();
              phoneNode.requestFocus();
            },
            focusNode: phoneNode,
            maxLength: 12,
            controller: phoneController,
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
              countrycode = phone.countryCode;
            },
          ),
        ),
        SizedBox(height: 20),
        Stack(
          children: [
            TextFormField(
              controller: passwordController,
              obscureText: _showPassword ? false : true,
              style: TextStyle(
                fontSize: 17,
                height: 1.3,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: Colors.teal,
              scrollPadding: EdgeInsets.only(left: 40.0),
              decoration: InputDecoration(
                labelText: 'password'.tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 0,
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Theme.of(context).dividerColor,
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () => Get.toNamed('/forgot'),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "forgotPassword".tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: FlatButton(
            height: 55,
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              LoginBloc.LogIn(countrycode, phoneController, passwordController);
            },
            child: Text(
              "login".tr,
              style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 18.0,
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 50),
        Container(
          width: MediaQuery.of(context).size.width,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "dontHaveAccount".tr,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              children: [
                TextSpan(text: " "),
                TextSpan(
                  text: 'signup'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed('/signup'),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
