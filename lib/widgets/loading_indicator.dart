import 'package:flutter/material.dart';
import '../config/app_strings.dart';

class EduSmartLoadingIndicator extends StatelessWidget {
  const EduSmartLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(AppStrings.getText(context, 'loading')),
        ],
      ),
    );
  }
}
