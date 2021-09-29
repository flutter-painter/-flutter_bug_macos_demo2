// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the 'License');
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an 'AS IS' BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:yobi/src/app/app_entry.dart';
import 'package:yobi/src/core/globals.dart' as globals;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globals.prefs = await SharedPreferences.getInstance();

  globals.appNavigator = GlobalKey<NavigatorState>();

  runApp(
    MediaQuery(
      data: MediaQueryData.fromWindow(window),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          color: Colors.grey,
          child: AppEntry(),
        ),
      ),
    ),
  );
}
