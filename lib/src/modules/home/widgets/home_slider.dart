// Copyright 2023, the hatemragab project author.
// All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:s_translation/generated/l10n.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:super_up_admin/src/modules/home/widgets/sheet_for_choose_language.dart';
import 'package:super_up_admin/src/modules/home/widgets/slider_colors.dart';
import 'package:super_up_core/super_up_core.dart';

import '../../splash.dart';

class HomeSlider extends StatefulWidget {
  final List<SidebarXItem> items;

  const HomeSlider({
    super.key,
    required SidebarXController controller,
    required this.items,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (extended) S.of(context).admin.h5.color(Colors.white),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    onLanguageChange(context);
                  },
                  child: Text(
                    VAppPref.getStringOrNullKey(
                          SStorageKeys.appLanguageTitle.name,
                        ) ??
                        "English",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    final res = await VAppAlert.showAskYesNoDialog(
                      context: context,
                      title: S.of(context).logOut,
                      content: S.of(context).areYouSure,
                    );
                    if (res == 1) {
                      await VAppPref.removeKey(SStorageKeys.isLogin.name);
                      await VAppPref.removeKey(
                        SStorageKeys.adminAccessPassword.name,
                      );
                      context.toPage(const Splash(),
                          removeAll: true, withAnimation: false);
                    }
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_right_square_fill,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            divider,
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
      items: widget.items,
    );
  }

  FutureOr<void> onLanguageChange(BuildContext context) async {
    final res = await showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SheetForChooseLanguage(),
    ) as ModelSheetItem?;
    if (res == null) {
      return;
    }
    //value.data = value.data.copyWith(language: res.title);
    await VLanguageListener.I.setLocal(Locale(res.id.toString()));
    await VAppPref.setStringKey(
      SStorageKeys.appLanguageTitle.name,
      res.title,
    );
    setState(() {});
  }
}
