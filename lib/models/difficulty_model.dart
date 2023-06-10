import 'package:flutter/material.dart';
import 'package:next_gen_ui/styles.dart';

class DifficultyModel extends ChangeNotifier {
  int _difficulty = 0;
  int? _difficultyOverride;

  Color get emiteColor => AppColors.emitColors[_difficultyOverride ?? _difficulty];

  Color get orbColor => AppColors.orbColors[_difficultyOverride ?? _difficulty];

  void handleDifficultyPressed(int value) {
    this._difficulty = value;
    notifyListeners();
  }

  void _handleDifficultyFocused(int? value) {
    this._difficultyOverride = value;
    notifyListeners();
  }
}
