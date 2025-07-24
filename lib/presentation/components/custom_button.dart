import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final bool isLoading;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.label,
    this.trailingIcon,
    this.leadingIcon,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 6,
                children: [
                  if (leadingIcon != null) Icon(leadingIcon),
                  Text(
                    label,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  if (trailingIcon != null) Icon(trailingIcon),
                ],
              ),
            ),
          );
  }
}
