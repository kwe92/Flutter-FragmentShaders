// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../assets.dart';
import '../styles.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

// ?? Why but private member variabless here? why not just use build method?
// ?? due to saving re-render??
  final _finalReceiveLightAmt = 0.7;
  final _finalEmitLightAmt = 0.5;

  @override
  Widget build(BuildContext context) {
    // final orbColor = AppColors.orbColors[0];
    // final emitColor = AppColors.emitColors[0];
    final orbColor = Colors.blueAccent;
    final emitColor = Color.fromRGBO(255, 103, 1, 1);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            // Image Plans: Background, Middle-ground, Foreground
            children: <Widget>[
              // Background
              Image.asset(AssetPaths.titleBgBase),
              _LitImage(
                color: orbColor,
                imgSrc: AssetPaths.titleBgReceive,
                lightAmt: _finalReceiveLightAmt,
              ),
              // Middle-ground
              _LitImage(
                color: orbColor,
                imgSrc: AssetPaths.titleMgBase,
                lightAmt: _finalReceiveLightAmt,
              ),
              _LitImage(
                color: orbColor,
                imgSrc: AssetPaths.titleMgReceive,
                lightAmt: _finalReceiveLightAmt,
              ),
              _LitImage(
                color: emitColor,
                imgSrc: AssetPaths.titleMgEmit,
                lightAmt: _finalEmitLightAmt,
              ),
              // Foreground
              Image.asset(AssetPaths.titleFgBase),
              _LitImage(
                color: orbColor,
                imgSrc: AssetPaths.titleFgReceive,
                lightAmt: _finalReceiveLightAmt,
              ),
              _LitImage(
                color: emitColor,
                imgSrc: AssetPaths.titleFgEmit,
                lightAmt: _finalEmitLightAmt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A Utility widget that recolors each of the art assets
// Depending on if the image is emitting or recieving light

class _LitImage extends StatelessWidget {
  final Color color;
  final String imgSrc;
  final double lightAmt;
  const _LitImage({
    required this.color,
    required this.imgSrc,
    required this.lightAmt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
// ? Why use HSL?
//     - computations (e.g., combining colors of light), because interpolation and
//       picking of colors as red, green, and blue channels doesn't always produce
//       intuitive results.

// ? new Widget HSLColor
    final hsl = HSLColor.fromColor(color);

    return Image.asset(
      imgSrc,
      // ? new function instantiated HSLColor.withLightness
      // ? new property instantiated HSLColor.lightness
      color: hsl.withLightness(hsl.lightness * lightAmt).toColor(),
      // ? new Widget BlendMode
      colorBlendMode: BlendMode.modulate,
    );
  }
}
