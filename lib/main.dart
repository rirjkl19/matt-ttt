import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/ttt_app.dart';

void main() {
  runApp(const ProviderScope(child: TttApp()));
}
