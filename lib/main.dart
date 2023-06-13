// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_gen_ui/models/difficulty_model.dart';
import 'package:next_gen_ui/models/start_button_model.dart';
import 'package:next_gen_ui/title_screen/title_screen.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(const Size(800, 500));
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: _getDifficultyModel,
        ),
        ChangeNotifierProvider(
          create: _getStartButtonModel,
        )
      ],
      child: const NextGenApp(),
    ),
  );
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: const TitleScreen(),
      );
}

DifficultyModel _getDifficultyModel(BuildContext context) => DifficultyModel();
StartButtonModel _getStartButtonModel(BuildContext context) => StartButtonModel();
