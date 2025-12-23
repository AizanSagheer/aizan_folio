import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isHovered ? AppColors().secondaryColor : Colors.transparent,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextButton(
              onPressed: widget.onPressed,
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: isHovered
                      ? AppColors().secondaryColor
                      : AppColors().textColor,
                  fontSize: 14,
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
