// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:extra_alignments/extra_alignments.dart';

import 'package:gap/gap.dart';

import '../assets.dart';

import '../common/ui_scaler.dart';

import '../styles.dart';

import "package:focusable_control_builder/focusable_control_builder.dart";

abstract class DifficultyOptions extends StatelessWidget {
  final int difficulty;
  final void Function(int difficulty) onDifficultyPressed;
  final void Function(int difficulty) onDifficultyFocused;

  const DifficultyOptions({
    required this.difficulty,
    required this.onDifficultyPressed,
    required this.onDifficultyFocused,
  });

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}

class TitleScreenUi extends DifficultyOptions {
  const TitleScreenUi({
    required super.difficulty,
    required super.onDifficultyPressed,
    required super.onDifficultyFocused,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 50,
        ),
        child: Stack(
          children: <Widget>[
            // Title Text
            const TopLeft(
              child: UiScaler(
                alignment: Alignment.topLeft,
                child: _TitleText(),
              ),
            ),
// Difficulty Btns
            // BottomLeft(
            //   child: UiScaler(
            //     child: _DifficultyBtns,
            //     alignment: Alignment.bottomLeft,
            //   ),
            // )
          ],
        ),
      );
}

class _TitleText extends StatelessWidget {
  const _TitleText({super.key});

  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Transform.translate(
                offset: Offset(-(TextStyles.h1.letterSpacing! * 0.5), 0),
                child: Text(
                  'OUTPOST',
                  style: TextStyles.h1,
                ),
              ),
              Image.asset(
                AssetPaths.titleSelectedLeft,
                height: 65,
              ),
              Text(
                "57",
                style: TextStyles.h2,
              ),
              Image.asset(AssetPaths.titleSelectedRight, height: 65)
            ],
          ),
          Text(
            "INTO THE UNKNOWN",
            style: TextStyles.h3,
          )
        ],
      );
}

class _DifficultyBtns extends DifficultyOptions {
  const _DifficultyBtns({
    required super.difficulty,
    required super.onDifficultyPressed,
    required super.onDifficultyFocused,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // _DifficultyBtn
        ],
      );
}

class _DifficultyBtn extends StatelessWidget {
  const _DifficultyBtn({super.key});

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
