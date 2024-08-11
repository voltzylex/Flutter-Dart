import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:ios_native_method/app/common/extensions/common_extension.dart';
import 'package:ios_native_method/app/common/widget/background_widget.dart';
import 'package:ios_native_method/app/common/widget/custom_textField.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';
import 'package:ios_native_method/app/features/authentication/presentation/widgets/IntlPhoneField/intl_phone_field.dart';
import 'package:ios_native_method/app/features/authentication/presentation/widgets/gradient_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Background(
      safeArea: true,
      top: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Welcome!",
              style: context.bLarge,
            ),
            Text(
              "We happy to see you again! to use your account, you should sign in first.",
              style: context.bSmall.copyWith(color: AppColors.grey),
            ),
            25.h,
            SizedBox(
              height: 54,
              width: 327,
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle:
                    context.bMedium.copyWith(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "Email",
                  ),
                  Tab(
                    text: "Phone numer",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: TabBarView(controller: _tabController, children: [
                emailTab(context),
                phoneTab(context),
              ]),
            ),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(
                  " Or with email",
                  style: context.tTheme.bodyMedium
                      ?.copyWith(color: AppColors.grey),
                ),
                Expanded(child: Divider()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column phoneTab(BuildContext context) => Column(
        children: [
          10.h,
          IntlPhoneField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            focusNode: FocusNode(),
            initialCountryCode: 'US', // Default country code
            showDropdownIcon: false,
            onChanged: (phone) {
              print(phone
                  .completeNumber); // Outputs the complete number with country code
            },
            onCountryChanged: (country) {
              print('Country changed to: ${country.name}');
            },
          ),
          30.h,
          GradientElevatedButton(
              onPressed: () {
                log("Button is clicked");
              },
              text: "Click me"),
        ],
      );

  Column emailTab(BuildContext ctx) {
    return Column(
      children: [
        25.h,
        const CustomTextfield(
          hint: "Email",
          preffixIcon: Icon(Icons.mail),
        ),
        10.h,
        const CustomTextfield(
          hint: "Your Password",
          preffixIcon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.visibility_off_outlined),
        ),
        10.h,
        Align(
          alignment: Alignment.centerRight,
          child: Text("Forgot Password ?",
              style: ctx.bMedium.copyWith(
                color: AppColors.secondary,
              )),
        ),
        10.h,
        GradientElevatedButton(
            onPressed: () {
              log("Button is clicked");
            },
            text: "Click me")
      ],
    );
  }
}
