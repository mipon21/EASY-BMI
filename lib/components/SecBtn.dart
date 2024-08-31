import 'package:flutter/material.dart';

class SecBtn extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4258065634.
  final VoidCallback onPressed;
  final IconData icon;

  const SecBtn({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
