import 'package:flutter/material.dart';
import 'package:ieee_iot/home/Widgets1/smart_light.dart';
import 'package:ieee_iot/home/Widgets1/smart_tv/smart_t_v.dart';

import '../../on_boarding/full_connection.dart';
import 'fan.dart';

class CustomDeviceContainer extends StatefulWidget {
  final String image;
  final String title;
  final int choice;
  final bool popUp;
  const CustomDeviceContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.choice,
    required this.popUp,

  }) : super(key: key);

  @override
  State<CustomDeviceContainer> createState() => _CustomDeviceContainerState();
}

class _CustomDeviceContainerState extends State<CustomDeviceContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          widget.popUp ?_openPopupMenu(context, widget.choice): null ;
        },
        child: Container(
              height: 164,
              width: 164,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: widget.popUp?Colors.white54:Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.image, width: 90, height: 90),
                  SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

void _openPopupMenu(BuildContext context, int choice) {
  List<Widget> PopUpMenuItems = [SmartLight(), Fan(), SmartTV()];
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(20),
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: PopUpMenuItems[choice - 1],
      );
    },
  );
}
