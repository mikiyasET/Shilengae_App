import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shilingae/utils/flags.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Widget gradientTop() {
      return Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xfff09191), Color(0xffc34439)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.7, 0.0),
              //stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      );
    }

    Widget appactionbutton() {
      return Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                print("heelo");
                Get.toNamed('/settings');
              },
            ),
            SizedBox(width: 10),
            Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ],
        ),
      );
    }

    Widget profilePicture() {
      return Center(
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cover.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 3,
              )),
        ),
      );
    }

    Widget fullName() {
      return Text(
        "Mikiyas Lemlemu",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    Widget localfacbookStatuss() {
      return FlatButton.icon(
        padding: EdgeInsets.only(left: 5.0, right: 15, top: 10, bottom: 10),
        color: Color(0xff3b5998),
        icon: Image.asset(
          "./assets/ic_facebook_logo@3x.png",
          width: 30.0,
          height: 20.0,
        ),
        label: Text(
          "Connect to Facebook",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      );
    }

    Widget localProfileBuilder(
        {label, text, icon = 0, button = 0, iconpos = 0}) {
      Map<String, String> _selectedCountry =
          countries.firstWhere((item) => item['code'] == 'ET');
      return Container(
        margin: EdgeInsets.symmetric(vertical: 13),
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Theme.of(context).dividerColor,
        ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    (icon != 0 && iconpos == 1)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(),
                              child: Text(
                                _selectedCountry['flag'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        /* true */ : Container() /* false */,
                    Text(text),
                    SizedBox(width: 5),
                    (icon != 0 && iconpos == 2)
                        ? Image.asset(
                            "./assets/icons/ic_verified_green@3x.png",
                            width: 17,
                          ) /* true */ : Container() /* false */,
                  ],
                ),
              ],
            ),
            button == 1
                ? FlatButton(
                    height: 27,
                    minWidth: 25,
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    }

    Widget profilelocaldetails() {
      return Column(
        children: [
          localProfileBuilder(
              label: "Email", text: "Mikiyaslemlemu@gmail.com", button: 1),
          localProfileBuilder(
              label: "Mobile Number",
              text: "+251 941398934",
              iconpos: 2,
              icon: 1),
          localProfileBuilder(
              label: "Country of Origin",
              text: "Ethiopia",
              iconpos: 1,
              icon: 1),
          localProfileBuilder(
            label: "State",
            text: "",
          ),
          localProfileBuilder(
            label: "City",
            text: "",
          ),
          localProfileBuilder(
            label: "Gender",
            text: "Male",
          ),
          localProfileBuilder(
            label: "Date of Birth",
            text: "",
          ),
          localProfileBuilder(
            label: "Career",
            text: "",
          ),
          localProfileBuilder(
            label: "Level",
            text: "",
          ),
          localProfileBuilder(
            label: "Experience Level",
            text: "",
          ),
          localProfileBuilder(
            label: "Education Level",
            text: "",
          ),
          localProfileBuilder(
            label: "Salary Expectation",
            text: "",
          ),
          SizedBox(height: 50)
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                gradientTop(),
                SafeArea(
                  child: Column(
                    children: [
                      appactionbutton(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      profilePicture(),
                      SizedBox(height: 12),
                      fullName(),
                      SizedBox(height: 5),
                      localfacbookStatuss(),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: profilelocaldetails(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
