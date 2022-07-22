import 'package:chayxana/pages/main/history/notification/notification_page.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbar(
    {required String title,
    required Function()? leadingFunction,
    required Function()? actionsFunction,
    required bool centerTitle,
    required bool leading,
    bool? actions}) {
  return AppBar(
    backgroundColor: AppColors.activeColor,
    leadingWidth: 30,
    elevation: 0,
    leading: leading
        ? Container(
            margin: const EdgeInsets.only(left: 8),
            child: const OpenSVG(
              path: AppAssets.arrowBackIC,
            ),
          )
        : const SizedBox.shrink(),
    // backgroundColor: AppColors.activeColor,
    centerTitle: centerTitle,
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: AppColors.unSelectedTextColor,
          fontWeight: FontWeight.w700),
    ),
    actions: [
      actions == null
          ? const SizedBox.shrink()
          : actions
              ? IconButton(
                  onPressed: actionsFunction,
                  icon: const OpenSVG(
                    height: 23,
                    width: 20,
                    path: AppAssets.closeIC,
                  ))
              : Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 15),
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: const Alignment(0.9, -0.9),
                    children: [
                      IconButton(
                        icon: const Image(
                          image: AssetImage('assets/images/im_notification.png'),
                        ),
                        onPressed: () {
                          Get.to(const NotificationPage());
                        },
                      ),
                      const CircleAvatar(
                        backgroundColor: Color(0xFFF44336),
                        radius: 7,
                      )
                    ],
                  ),
                ),
    ],
  );
}
