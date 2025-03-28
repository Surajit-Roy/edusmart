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
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.green, end: Colors.lightBlue),
            duration: const Duration(seconds: 1),
            onEnd: () => build(context), // Restarts the animation loop
            builder: (context, color, child) {
              return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color));
            },
          ),
          const SizedBox(height: 10),
          Text(AppStrings.getText(context, 'loading')),
        ],
      ),
    );
  }
}

