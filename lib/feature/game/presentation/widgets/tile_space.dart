import 'package:flutter/widgets.dart';

class TileSpace extends StatelessWidget {
  const TileSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF000000),
        ),
      ),
    );
  }
}
