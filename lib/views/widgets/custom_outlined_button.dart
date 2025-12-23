import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  final ValueNotifier<bool> isHoveredNotifier = ValueNotifier(false);

  @override
  void dispose() {
    isHoveredNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHoveredNotifier.value = true,
      onExit: (_) => isHoveredNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHoveredNotifier,
        builder: (context, isHovered, _) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors().textColor.withOpacity(0.5),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextButton(
              onPressed: widget.isLoading ? null : widget.onPressed,
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors().textColor,
                      ),
                    )
                  : Text(
                      widget.text,
                      style: TextStyle(
                        color:
                            isHovered ? Colors.white : AppColors().textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
