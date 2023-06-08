import 'package:flutter/material.dart';

import 'package:extra_alignments/extra_alignments.dart';

import 'package:gap/gap.dart';

import '../assets.dart';

import '../common/ui_scaler.dart';

import '../styles.dart';

class TitleScreenUi extends StatelessWidget {
  const TitleScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 50,
      ),
      child: Stack(
        children: <Widget>[
          // Title Text
          // TODO: Finish implementing
          TopLeft()
        ],
      ),
    );
  }
}
