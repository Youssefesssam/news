import 'package:flutter/material.dart';

class AddLaoder extends StatelessWidget {
  const AddLaoder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}