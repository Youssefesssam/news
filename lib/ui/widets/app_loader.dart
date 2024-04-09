import 'package:flutter/material.dart';

class AppLaoder extends StatelessWidget {
  const AppLaoder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.green),
    );
  }
}