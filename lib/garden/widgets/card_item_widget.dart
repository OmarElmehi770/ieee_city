import 'package:flutter/material.dart';

import '../../on_boarding/full_connection.dart';

class CardItemWidget extends StatefulWidget {
  final String image;
  final Icon iconDown;
  final String title;
  final String char;

  const CardItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.iconDown,
    required this.char,
  });

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  bool isValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(widget.image, height: 39),
                const Spacer(),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isValue ? const Color(0xff00FF1E) : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.title, style: const TextStyle(fontSize: 16)),
            IconButton(
              onPressed: () {
                setState(() {
                  isValue = !isValue;
                });
                BluetoothConnectionScreenState.sendData(widget.char);
              },
              icon: Icon(
                Icons.power_settings_new,
                color: isValue ? const Color(0xff00FF1E) : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
