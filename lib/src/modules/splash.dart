// Copyright 2023, the hatemragab project author.
// All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:super_up_admin/src/modules/spotify/spotify_view.dart';
// import 'package:super_up_admin/src/modules/home/home_page.dart';
// import 'package:super_up_admin/src/modules/login/login_screen.dart';
import 'package:super_up_core/super_up_core.dart';

import 'home_tabs/Local_View.dart';
import 'login/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _nav();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void _nav() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);
    context.toPage(Spotify(), withAnimation: true, removeAll: true);


    // if (isLogin) {
    //   context.toPage(Spotify(), withAnimation: true, removeAll: true);
    // } else {
    //   context.toPage(const LoginScreen(), withAnimation: true, removeAll: true);
    // }
  }
  void _nav1() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final isLogin = VAppPref.getBool(SStorageKeys.isLogin.name);

    if (isLogin) {
      context.toPage(Spotify(), withAnimation: true, removeAll: true);
    } else {
      context.toPage(const LoginScreen(), withAnimation: true, removeAll: true);
    }
  }
}
