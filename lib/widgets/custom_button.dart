import 'package:flutter/material.dart';

// class EduSmartButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color? color;
//   final Color? textColor;
//   final double? width;
//   final double? height;

//   const EduSmartButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.color,
//     this.textColor,
//     this.width,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? double.infinity,
//       height: height ?? 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color ?? Colors.blue,
//           foregroundColor: textColor ?? Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: onPressed,
//         child: Text(text, style: const TextStyle(fontSize: 16)),
//       ),
//     );
//   }
// }

class EduSmartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const EduSmartButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child:
          isLoading
              ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
