import 'package:flutter/material.dart';
import '../../home/Widgets1/custom_device_container.dart';
import '../models/rooms/rooms_list.dart';
import '../models/rooms/rooms_model.dart';
import '../widgets/device_card.dart';
import '../widgets/room_card.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key,required this.sendData,required this.recievedMessage,});
  final void Function(String data) sendData;
  final String recievedMessage;
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  Room? selectedRoom = rooms[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading:
        //     selectedRoom != null
        //         ? IconButton(
        //           icon: Icon(Icons.arrow_back_outlined),
        //           onPressed: () {
        //             setState(() {
        //               selectedRoom = null;
        //             });
        //           },
        //         )
        //         : null,
        title: Text(
          "Living Room",
          // selectedRoom == null ? 'Rooms' : selectedRoom!.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      //body: selectedRoom == null ? RoomsGrid() : DevicesGrid(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomDeviceContainer(
                title: "Smart light",
                image: 'assets/images/idea_colored.png',
                choice: 1,
              ),
              CustomDeviceContainer(
                title: "Fan",
                image: 'assets/images/fan_colored.png',
                choice: 2,
              ),
            ],
          ),
          CustomDeviceContainer(
            title: "Smart TV",
            image: 'assets/images/responsive_colored.png',
            choice: 3,
          ),
        ],
      ),
    );
  }

  // Widget RoomsGrid() {
  //   return GridView.builder(
  //     padding: EdgeInsets.all(16),
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 16,
  //       mainAxisSpacing: 16,
  //     ),
  //     itemCount: rooms.length,
  //     itemBuilder: (context, index) {
  //       var room = rooms[index];
  //       return RoomCard(
  //         img: room.image,
  //         txt: room.name,
  //         device: ' ${room.devices.length} devices',
  //         ontap: () {
  //           setState(() {
  //             selectedRoom = room;
  //           });
  //         },
  //       );
  //     },
  //   );
  // }

  Widget DevicesGrid() {
    var devices = selectedRoom!.devices;
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        var device = devices[index];
        return DeviceCard(
          clr2: device.isOn ? Colors.lightGreen : Colors.grey.shade200,
          clr: device.isOn ? Colors.red : Colors.grey,
          icon: device.icon,
          ontap: () {
            setState(() {
              device.isOn = !device.isOn;
            });
          },
          name: device.name,
          isOn: device.isOn,
          onChanged: (val) {
            setState(() {
              device.isOn = val;
            });
          },
        );
      },
    );
  }
}
