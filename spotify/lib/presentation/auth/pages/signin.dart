import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/common_functions.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

import '../../../service_locator.dart';
import '../../root/pages/root.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.assetsVectorsSpotifyLogo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signinText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            50.h,
            _customField(context, "Enter Email", email),
            20.h,
            _customField(context, "Password", password),
            20.h,
            BasicAppButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                final signIn = await sl<SigninUsecase>().call(
                    param: SigninUserReq(
                        email: email.text, password: password.text));
                showSnackbar(String message) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                signIn.fold(
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
              title: "Sign In",
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Sign In",
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

  Widget _signinText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not A Member?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPage(),
            ),
          ),
          child: const Text("Register Now"),
        ),
      ],
    ).padding(const EdgeInsets.only(bottom: 10));
  }
}
