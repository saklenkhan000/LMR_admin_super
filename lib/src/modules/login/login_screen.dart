// Copyright 2023, the hatemragab project author.
// All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:s_translation/generated/l10n.dart';
import 'package:super_up_admin/src/modules/home/home_page.dart';
// import 'package:super_up_admin/src/modules/home/home_page.dart';
import 'package:super_up_core/super_up_core.dart';

import '../../core/api_service/api_service.dart';
import '../../core/utils/flutter_flow_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFiled = TextEditingController();
  bool _saveLogin = true;
  final vAdminApiService = GetIt.I.get<SAdminApiService>();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      // _passwordFiled.text = "super-up-strong-password-viewer";
      _passwordFiled.text = "lmrhub@123";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
              tablet: false)
          ? AppBar(
              title: const Text(SConstants.appName),
              centerTitle: true,
            )
          : null,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 400,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (responsiveVisibility(context: context, phone: false))
                  Column(
                    children: [
                      SConstants.appName.h5,
                      const Divider(),
                    ],
                  ),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.lock_fill,
                          size: 70,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _passwordFiled,
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: S.of(context).password,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckboxListTile(
                          title: Text(S.of(context).saveLogin),
                          value: _saveLogin,
                          onChanged: (value) {
                            setState(() {
                              _saveLogin = value ?? false;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: _login,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: S.of(context).login.h6,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    await vSafeApiCall<bool>(
      request: () async {
        VAppAlert.showLoading(context: context);
        if (_passwordFiled.text.isEmpty) {
          throw S.of(context).passwordIsRequired;
        }
        await VAppPref.setHashedString(
          SStorageKeys.adminAccessPassword.name,
          _passwordFiled.text,
        );
        if
        // (_passwordFiled.text == "super-up-strong-password-viewer")
        (_passwordFiled.text == "lmrhub@123")
        {
          VAppAlert.showSuccessSnackBar(
            message: S
                .of(context)
                .nowYouLoginAsReadOnlyAdminAllEditYouDoneWillNotAppliedDueToThisIsTestVersion,
            context: context,
            duration: const Duration(seconds: 20),
          );
        }
        return await vAdminApiService.login();
      },
      onSuccess: (response) async {

        if (_saveLogin) {
          await VAppPref.setBool(SStorageKeys.isLogin.name, true);
        } else {
          await VAppPref.setBool(SStorageKeys.isLogin.name, false);
        }
        await VAppPref.setBool(SStorageKeys.isViewer.name, response);
        context.toPage(const HomePage(), withAnimation: true, removeAll: true);
      },
      onError: (exception, trace) {
        Navigator.of(context).pop();
        VAppAlert.showErrorSnackBar(
          context: context,
          message: exception,
        );
      },
    );
  }
}
