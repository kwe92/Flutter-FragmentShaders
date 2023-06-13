import 'package:flutter/material.dart';

class StartButtonModel extends ChangeNotifier {
  AnimationController? _btnAnim;
  bool _wasHovered = false;

  AnimationController? get btnAnim => _btnAnim;
  bool get wasHovered => _wasHovered;

  void setWasHovered(bool isHovered) {
    _wasHovered = isHovered;
    notifyListeners();
  }
}
