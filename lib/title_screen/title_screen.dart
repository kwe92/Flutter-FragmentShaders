// ignore_for_file: unused_import

// TODO: Move to FlutterWidgets repo
// ?? new package extra_alignments.dart
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:next_gen_ui/title_screen/title_screen_ui.dart';

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
    final orbColor = AppColors.orbColors[2];
    final emitColor = AppColors.emitColors[2];

    return SafeArea(
      child: Scaffold(
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
              // TODO: Uncomment after creating buttons
              // Positioned.fill(
              //   child: TitleScreenUi(),
              // )
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

// TODO: Move to FlutterWidgets repo
// ?? new package extra_alignments.dart

// SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Stack(children: [
//           TopLeft(
//             child: Container(
//               height: 100,
//               width: 500,
//               color: Colors.purple,
//             ),
//           ),
//           TopCenter(
//             child: Container(
//               height: 100,
//               width: 900,
//               color: Colors.orange,
//             ),
//           ),
//           TopRight(child: Text("Top Right")),
//           CenterLeft(
//             child: Container(
//               height: 860,
//               width: 100,
//               color: Colors.blueAccent,
//             ),
//           ),
//           CenterRight(child: Text("Center Right")),
//           Positioned(
//             top: 870,
//             left: 100,
//             child: BottomLeft(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Container(
//                   height: 100,
//                   width: 575,
//                   color: Colors.amberAccent,
//                 ),
//               ),
//             ),
//           ),
//           BottomCenter(child: Text("Bottom Center")),
//           BottomRight(child: Text("Bottom Right")),
//         ]),
