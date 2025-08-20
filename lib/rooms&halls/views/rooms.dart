import 'package:flutter/material.dart';
import '../../home/Widgets1/custom_device_container.dart';
import '../../on_boarding/full_connection.dart';
import '../models/rooms/rooms_list.dart';
import '../models/rooms/rooms_model.dart';
import '../widgets/device_card.dart';
import '../widgets/room_card.dart';

class Rooms extends StatefulWidget {
  const Rooms({
    super.key,
    required this.sendData,
    required this.recievedMessage,
  });
  final void Function(String data) sendData;
  final String recievedMessage;
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  Room? selectedRoom = rooms[1];
  bool ecoLightOn = false;
  bool sleepModeOn = false;
  bool smartLight = true;
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
          "My Room",
          // selectedRoom == null ? 'Rooms' : selectedRoom!.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      //body: selectedRoom == null ? RoomsGrid() : DevicesGrid(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              width: double.infinity,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 2,),
                  Image.asset('assets/icons/eco_light.png', width: 60, height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Eco Light',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (sleepModeOn){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Close Sleep Mode First, Please"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }else{
                          ecoLightOn =! ecoLightOn;
                          if(ecoLightOn){
                            BluetoothConnectionScreenState.sendData("ECO_LIGHT_ON");
                            smartLight= false;
                          }
                          else{
                            BluetoothConnectionScreenState.sendData("ECO_LIGHT_OFF");
                            smartLight= true;
                          }
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 100,
                      height: 50,
                      child: Icon(
                        ecoLightOn ? Icons.toggle_on : Icons.toggle_off,
                        size: 50,
                        color: ecoLightOn ? const Color(0xFF0207FD) : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              width: double.infinity,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 2,),
                  Image.asset('assets/icons/moon_1.png', width: 60, height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Sleep Mode',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (ecoLightOn){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Close Eco Light First, Please"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }else{
                          sleepModeOn =! sleepModeOn;
                          if(sleepModeOn){
                            BluetoothConnectionScreenState.sendData("SLEEP_MODE_ON");
                            smartLight= false;
                          }
                          else{
                            BluetoothConnectionScreenState.sendData("SLEEP_MODE_OFF");
                            smartLight= true;
                          }
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 100,
                      height: 50,
                      child: Icon(
                        sleepModeOn ? Icons.toggle_on : Icons.toggle_off,
                        size: 50,
                        color: sleepModeOn ? const Color(0xFF0207FD) : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              CustomDeviceContainer(
                title: "Smart light",
                image: 'assets/images/idea_colored.png',
                choice: 1,
                popUp: smartLight,
              ),
              CustomDeviceContainer(
                title: "Fan",
                image: 'assets/images/fan_colored.png',
                choice: 2,
                popUp: true,
              ),
            ],
          ),
          Row(
            children: [
              CustomDeviceContainer(
                title: "Smart TV",
                image: 'assets/images/responsive_colored.png',
                choice: 3,
                popUp: true,
              ),
            ],
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
