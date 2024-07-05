import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title});
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? AppColors.white.withOpacity(.03)
                : AppColors.black.withOpacity(.04),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: context.isDarkMode ? AppColors.white : AppColors.black,
            size: 15,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
