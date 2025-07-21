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
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isHovered ? AppColors().secondaryColor : Colors.transparent,
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
      ),
    );
  }
}
