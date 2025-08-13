import 'package:flutter/material.dart';

class CarsCard extends StatefulWidget {
  const CarsCard({super.key, required this.recievedMessage});

  final String recievedMessage;

  @override
  State<CarsCard> createState() => _CarsCardState();
}

class _CarsCardState extends State<CarsCard> {
  int carsNumber = 0;

  @override
  void didUpdateWidget(CarsCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    // لو الرسالة الجديدة رقم، حدّثها
    final parsedNumber = int.tryParse(widget.recievedMessage);
    if (parsedNumber != null) {
      carsNumber = parsedNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset('assets/images/car_garage.jpg'),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Text(
                  'Total Cars',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('$carsNumber Cars'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
