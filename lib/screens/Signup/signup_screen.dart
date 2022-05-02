// @dart=2.9
import 'package:ambulance_tracker/screens/choice_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_tracker/constants.dart';
import 'package:ambulance_tracker/screens/Login/login_screen.dart';
import 'package:ambulance_tracker/Components/already_have_an_account_acheck.dart';
import 'package:ambulance_tracker/Components/rounded_button.dart';
import 'package:ambulance_tracker/Components/rounded_input_field.dart';
import 'package:ambulance_tracker/Components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/hands.png",
                width: size.width * 0.7,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: "Email",
                    hintStyle:
                    TextStyle(color: Colors.grey[400])),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: "Password",
                    hintStyle:
                    TextStyle(color: Colors.grey[400])),
              ),
            ),
            const SizedBox(height: 20,),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation,
                          secondaryAnimation) =>
                          ChoicePage(),
                      transitionsBuilder: (context,
                          animation,
                          secondaryAnimation,
                          child) =>
                          FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                    ),
                  );

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    content: Text("Account created"),
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    content:
                    Text("Account creation failed"),
                  ));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}



class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}


