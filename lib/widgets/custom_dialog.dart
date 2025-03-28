import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edusmart/core/utils/images.dart';

enum DialogType { error, success, warning, info, delete }

class EduSmartDialog {
  final String title;
  final String message;
  final DialogType dialogType;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  EduSmartDialog({
    required BuildContext context,
    required this.title,
    required this.message,
    required this.dialogType,
    required this.onConfirm,
    this.onCancel,
  }) {
    showcustomDialog(context);
  }

  String _getImagePath() {
    switch (dialogType) {
      case DialogType.error:
        return failure;
      case DialogType.warning:
        return warning;
      case DialogType.info:
        return info;
      case DialogType.success:
        return success;
      case DialogType.delete:
        return warning;
    }
  }

  void showcustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(_getImagePath(), width: 60, height: 60),
                  const SizedBox(height: 10),
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (onCancel != null)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onCancel?.call();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onConfirm.call();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            "OK",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
