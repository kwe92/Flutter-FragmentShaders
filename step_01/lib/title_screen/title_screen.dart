// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../assets.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              children: <Widget>[
                Image.asset(AssetPaths.titleBgBase),
                Image.asset(AssetPaths.titleBgReceive),
                // Image.asset(AssetPaths.title),
                // Image.asset(AssetPaths.title),
                // Image.asset(AssetPaths.title),
                // Image.asset(AssetPaths.title),
                // Image.asset(AssetPaths.title),
                // Image.asset(AssetPaths.title),
              ],
            ),
          ),
        ),
      );
}
