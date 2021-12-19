import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;

  const AppBarWidget({Key? key, this.title, this.actions, this.titleWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstants.appPaddingHorizontal,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppUtils.isNullEmpty(titleWidget) ? Text(
              title ?? '',
              style: ThemeText.body1Pacifico
                  .copyWith(color: AppColor.primaryColor),
            ) : titleWidget!,
            AppUtils.isNullEmpty(actions)
                ? const SizedBox.shrink()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
