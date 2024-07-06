import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/common_functions.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/root/pages/root.dart';

import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.assetsVectorsSpotifyLogo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signupText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            50.h,
            _customField(context, "Full Name", fullName),
            20.h,
            _customField(context, "Enter Email", email),
            20.h,
            _customField(context, "Password", password),
            20.h,
            BasicAppButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                final result = await sl<SignupUseCase>().call(
                  param: CreateUserReq(
                    fullName: fullName.text,
                    email: email.text,
                    password: password.text,
                  ),
                );
                showSnackbar(String message) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                result.fold(
                  (l) {
                    debugLog(l, isLog: false);
                    showSnackbar(l);
                  },
                  (r) {
                    debugLog(r, isLog: false);
                    showSnackbar(r);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: "Create Account",
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _customField(
      BuildContext context, String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Do You Have An Account?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SigninPage(),
              ),
            );
          },
          child: const Text("Sign in"),
        ),
      ],
    ).padding(const EdgeInsets.only(bottom: 10));
  }
}
