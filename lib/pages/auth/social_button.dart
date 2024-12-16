import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({required this.icon, required this.onPressed, super.key});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: HugeIcon(
        icon: icon,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
