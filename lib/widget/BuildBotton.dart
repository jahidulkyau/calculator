import 'package:flutter/material.dart';

class BuildBotton extends StatelessWidget {
  final VoidCallback onClick;

  String text;
  Color ? color;

   BuildBotton({
    super.key,
    required this.text,
      this.color,
      required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:color ?? Colors.grey[850],
                padding: EdgeInsets.all(24),
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7))
            ),
            onPressed: onClick,
            child: Text(
              text,
              style: TextStyle(fontSize: 24, color: Colors.white),
            )),
      ),
    );
  }
}
