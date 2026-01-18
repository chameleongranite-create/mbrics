import 'package:flutter/material.dart';
import '../widgets/mbrics_components.dart';

class HoverButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const HoverButton({super.key, required this.onPressed, required this.buttonText});

  @override
  State<HoverButton> createState() => HoverButtonState();
}

class HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : const Color(0xFFC2994B),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFC2994B), width: 2),
            boxShadow: _isHovered ? [BoxShadow(color: const Color(0xFFC2994B).withOpacity(0.4), blurRadius: 15)] : [],
          ),
          child: Center(
            child: Text(
              widget.buttonText.toUpperCase(), 
              style: TextStyle(
                fontFamily: 'Inter', 
                color: _isHovered ? const Color(0xFFC2994B) : Colors.white, 
                fontWeight: FontWeight.w900, 
                fontSize: 13, 
                letterSpacing: 1
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatusPulseRow extends StatelessWidget {
  final String statusText;
  const StatusPulseRow({super.key, required this.statusText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Container(
          width: 8, height: 8, 
          decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle)
        ),
        const SizedBox(width: 10),
        Text(
          statusText, 
          style: const TextStyle(fontFamily: 'ShareTechMono', fontSize: 11, color: Color(0xFF4CAF50))
        ),
      ]
    );
  }
}