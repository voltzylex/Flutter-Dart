import 'package:flutter/material.dart';
import 'package:ios_native_method/app/common/extensions/common_extension.dart';
import 'package:ios_native_method/app/common/widget/background_widget.dart';
import 'package:ios_native_method/app/common/widget/custom_textField.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';

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
                    text: "Second",
                  ),
                ],
              ),
            ),
            25.h,
            const CustomTextfield(),
          ],
        ),
      ),
    );
  }
}
