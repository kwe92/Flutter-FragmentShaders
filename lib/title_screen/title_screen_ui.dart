// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:extra_alignments/extra_alignments.dart';

import 'package:gap/gap.dart';
import 'package:next_gen_ui/models/start_button_model.dart';
import 'package:provider/provider.dart';

import '../assets.dart';

import '../common/ui_scaler.dart';

import '../styles.dart';

import "package:focusable_control_builder/focusable_control_builder.dart";

abstract class DifficultyOptions extends StatelessWidget {
  final int difficulty;
  final void Function(int difficulty) onDifficultyPressed;
  final void Function(int? difficulty) onDifficultyFocused;

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
            BottomLeft(
              child: UiScaler(
                child: _DifficultyBtns(
                  difficulty: difficulty,
                  onDifficultyPressed: onDifficultyPressed,
                  onDifficultyFocused: onDifficultyFocused,
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            // Start Button
            BottomRight(
              child: UiScaler(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 40),
                  child: _StartButton(onPressed: () {}),
                ),
              ),
            )
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
          _DifficultyBtn(
            label: "Casual",
            selected: difficulty == 0,
            onPressed: () => onDifficultyPressed(0),
            onHover: (over) => onDifficultyFocused(
              over ? 0 : null,
            ),
          ),
          _DifficultyBtn(
            label: "Normal",
            selected: difficulty == 1,
            onPressed: () => onDifficultyPressed(1),
            onHover: (over) => onDifficultyFocused(
              over ? 1 : null,
            ),
          ),
          _DifficultyBtn(
            label: "Hardcore",
            selected: difficulty == 2,
            onPressed: () => onDifficultyPressed(2),
            onHover: (over) => onDifficultyFocused(
              over ? 2 : null,
            ),
          ),
        ],
      );
}

class _DifficultyBtn extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onPressed;
  final void Function(bool hasFocus) onHover;
  const _DifficultyBtn({
    required this.label,
    required this.selected,
    required this.onPressed,
    required this.onHover,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FocusableControlBuilder(
        builder: (_, state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 250,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D1FF).withOpacity(0.1),
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                  ),
                  if (state.isHovered || state.isFocused) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D1FF).withOpacity(0.1),
                      ),
                    )
                  ],
                  // cross-hairs (selected state)
                  if (selected) ...[
                    CenterLeft(
                      child: Image.asset(AssetPaths.titleSelectedLeft),
                    ),
                    CenterRight(
                      child: Image.asset(AssetPaths.titleSelectedRight),
                    )
                  ],
                  // Label
                  Center(
                    child: Text(
                      label.toUpperCase(),
                      style: TextStyles.btn,
                    ),
                  )
                ],
              )),
        ),
        onPressed: () {},
      );
}

typedef VoidCallback = void Function();

class _StartButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _StartButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FocusableControlBuilder(
      // Changes what the cursor looks like when you hover over a Widget
      cursor: SystemMouseCursors.click,
      onPressed: onPressed,
      builder: (_, FocusableControlState state) => Consumer(
            builder: (BuildContext context, StartButtonModel startBtnModel, _) {
              if ((state.isHovered || state.isFocused) &&
                  !startBtnModel.wasHovered &&
                  startBtnModel.btnAnim?.status != AnimationStatus.forward) {
                startBtnModel.btnAnim?.forward(from: 0);
              }
              startBtnModel.setWasHovered((state.isHovered || state.isFocused));
              return SizedBox(
                width: 520,
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(AssetPaths.titleStartBtn),
                    ),
                    if ((state.isHovered || state.isFocused)) ...[
                      Positioned.fill(
                        child: Image.asset(AssetPaths.titleStartBtnHover),
                      ),
                    ],
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'START MISSION',
                            style: TextStyles.btn.copyWith(
                              fontSize: 24,
                              letterSpacing: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ));
}
