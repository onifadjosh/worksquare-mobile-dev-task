
import 'package:flutter/material.dart';
import 'package:worksquare_mobile_dev_task/colors/dream_estate_color.dart';



class DreamEstateButton extends StatelessWidget {
  const DreamEstateButton({
    super.key,
    required this.label,
    this.expanded = true,
    this.onPressed,
    this.loading = false,
    this.backgroundColor,
    this.icon,
    this.textStyle, 
  });

  final String label;
  final bool expanded;
  final void Function()? onPressed;
  final bool loading;
  final Color? backgroundColor;
  final Widget? icon;
  final TextStyle? textStyle; 

  @override
  Widget build(BuildContext context) {
    var child = ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: backgroundColor ?? DreamEstateColor.primary500,
      ),

      onPressed:onPressed,
      child: loading
          ? Text("Loading...", style: textStyle ?? const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: textStyle ?? 
                      const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                ),
                if (icon != null) const SizedBox(width: 8),
                if (icon != null) icon!,
              ],
            ),
    );

    if (!expanded) {
      return child;
    }

    return Row(
      children: [
        Expanded(child: child),
      ],
    );
  }
}
