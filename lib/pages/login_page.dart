import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lil_broc/pages/dashboard_page.dart';
import 'package:lil_broc/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(size, theme),
          _buildButtons(size, context),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const SafeArea(
      top: false,
      minimum: EdgeInsets.only(bottom: 15),
      child: Text(
        "Terms of Use",
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildButtons(Size size, BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoginButton(
            txt: "Login with facebook",
            img: "facebook.png",
            size: size,
            iconColor: Colors.white,
            buttonColor: const Color(0xff3b5998),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DashBoardPage(),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          _buildLoginButton(
            txt: "Sign in with Google",
            img: "google.png",
            size: size,
            textColor: Colors.black,
            buttonColor: Colors.white,
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomePage(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton({
    required String txt,
    required String img,
    required Function() onPressed,
    required Size size,
    required Color buttonColor,
    Color textColor = Colors.white,
    Color? iconColor,
  }) {
    return SizedBox(
      width: size.width * 0.70,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 18,
              child: Image.asset(
                "assets/icon/$img",
                fit: BoxFit.fill,
                color: iconColor,
              ),
            ),
            Text(
              txt,
              style: TextStyle(color: textColor, fontSize: 10),
            ),
            SizedBox(
              height: 18,
              child: Image.asset(
                "assets/icon/$img",
                fit: BoxFit.fill,
                color: buttonColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Size size, ThemeData theme) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        decoration: BoxDecoration(color: theme.primaryColorLight),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.40,
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: size.height * 0.1,
                child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 500),
                  repeatForever: true,
                  animatedTexts: [
                    _buildFadeAnimatedTxt(
                        'Over 90% of garlic in te U.S. comes from California'),
                    _buildFadeAnimatedTxt(
                        'Although tomatoes are commonly classified amongst vegetables, they are actually fruits.'),
                    _buildFadeAnimatedTxt(
                        'Gooseberry clubs and societies were formed in England around this fruit. The oldest and active Gooseberry Club. Egton Bridge, began in 1801'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeAnimatedText _buildFadeAnimatedTxt(String txt) => FadeAnimatedText(
        txt,
        textAlign: TextAlign.center,
        duration: const Duration(milliseconds: 5000),
        textStyle: const TextStyle(fontSize: 12),
      );
}
