import 'package:flutter/material.dart';

import '../on_boarding/full_connection.dart';

class GarageCard extends StatefulWidget {
  const GarageCard({super.key,
    required this.sendData,
  });
  final void Function(String data) sendData;
  

  @override
  State<GarageCard> createState() => _GarageCardState();
  
}

class _GarageCardState extends State<GarageCard> {
  bool garageOpen=true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 190,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.directions_car_outlined, size: 40),
                  SizedBox(height: 10),
                  Text('Garage', style: TextStyle(fontSize: 20)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        garageOpen = !garageOpen;
                        BluetoothConnectionScreenState.sendData("Garage_ON");
                      });
                    },
                    icon: Icon(
                      Icons.power_settings_new,
                      size: 30,
                      color: garageOpen ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: garageOpen ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
