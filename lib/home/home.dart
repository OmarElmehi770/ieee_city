import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import '../garage/garage_screen.dart';
import '../garden/screens/garden_screen.dart';
import '../on_boarding/full_connection.dart';
import '../rooms&halls/views/halls.dart';
import '../rooms&halls/views/rooms.dart';
import 'Widgets1/custom_container.dart';
import 'Widgets1/custom_device_container.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.recievedMessage,
    required this.sendData,
  });
  final String recievedMessage;
  final void Function(String data) sendData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool security = true;
  bool powerSaving = true;
  bool securityAlarm = true;
  String password = '';
  String correctPassword = "124CCA" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome Home",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [Image.asset('assets/images/IEEE.png')],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 60),
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
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Security',
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
                          security = !security;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 100,
                        height: 50,
                        child: Icon(
                          security ? Icons.toggle_on : Icons.toggle_off,
                          size: 50,
                          color: security ? const Color(0xFF0207FD) : Colors.grey,
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
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Power Saving',
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
                          powerSaving = !powerSaving;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 100,
                        height: 50,
                        child: Icon(
                          powerSaving ? Icons.toggle_on : Icons.toggle_off,
                          size: 50,
                          color: powerSaving ? const Color(0xFF0207FD) : Colors.grey,
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
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Security Alarm',
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
                          securityAlarm = !securityAlarm;
                          BluetoothConnectionScreenState.sendData("STOP_ALERT");

                        });
                      },
                      child: Text("Stop",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18,),),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 480),
            ListTile(
              title: Text(
                'Back to connection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.bluetooth_connected,
                size: 28,
                color: Colors.black,
                weight: 20,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              //leading: Icon(Icons.arrow_back_ios_new),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 106,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cairo,20 May 2025",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.cloudy_snowing, color: Colors.blue),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text("Rainy Day"),
                                    Text(
                                      "30°C",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("25%", style: TextStyle(color: Colors.blue)),
                          Text(
                            'indoor humidity',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text("29%", style: TextStyle(color: Colors.blue)),
                          Text(
                            'outdoor humidity',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => StatefulBuilder(
                        builder:
                            (
                            BuildContext context,
                            void Function(void Function()) setState,
                            ) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          backgroundColor: Colors.grey,
                          content: Container(
                            height: 370,
                            width: double.infinity,
                            child: Column(
                              spacing: 12,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      password,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    btn(
                                      text: '<-',
                                      onTap: () {
                                        setState(() {
                                          password = password
                                              .substring(
                                            0,
                                            password.length -
                                                1,
                                          );
                                        });
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: 'Reset',
                                      onTap: () {

                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 100,
                                    ),
                                    btn(
                                      text: '✔️',
                                      onTap: () {
                                        setState((){
                                          if (password == correctPassword ){
                                            BluetoothConnectionScreenState.sendData(password);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("✅ Door Opened"),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            password = '' ;
                                          }else {
                                            password = '' ;
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("❌ Wrong Password"),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    btn(
                                      text: '1',
                                      onTap: () {
                                        password.length<6?
                                        password += '1':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '2',
                                      onTap: () {
                                        password.length<6?
                                        password += '2':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '3',
                                      onTap: () {
                                        password.length<6?
                                        password += '3':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: 'A',
                                      onTap: () {
                                        password.length<6?
                                        password += 'A':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    btn(
                                      text: '4',
                                      onTap: () {
                                        password.length<6?
                                        password += '4':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '5',
                                      onTap: () {
                                        password.length<6?
                                        password += '5':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '6',
                                      onTap: () {
                                        password.length<6?
                                        password += '6':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: 'B',
                                      onTap: () {
                                        password.length<6?
                                        password += 'B':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    btn(
                                      text: '7',
                                      onTap: () {
                                        password.length<6?
                                        password += '7':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '8',
                                      onTap: () {
                                        password.length<6?
                                        password += '8':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '9',
                                      onTap: () {
                                        password.length<6?
                                        password += '9':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: 'C',
                                      onTap: () {
                                        password.length<6?
                                        password += 'C':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    btn(
                                      text: '*',
                                      onTap: () {
                                        password.length<6?
                                        password += '*':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '0',
                                      onTap: () {
                                        password.length<6?
                                        password += '0':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.blue,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: '#',
                                      onTap: () {
                                        password.length<6?
                                        password += '#':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                    btn(
                                      text: 'D',
                                      onTap: () {
                                        password.length<6?
                                        password += 'D':null;
                                        setState(() {});
                                      },
                                      btnColor: Colors.red,
                                      textColor: Colors.white,
                                      btnWidth: 50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Enter Home Password',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward, size: 30),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // children: [
                    //   CustomDeviceContainer(
                    //     title: "Smart light",
                    //     image: 'assets/images/idea_colored.png',
                    //     choice: 1,
                    //   ),
                    //   CustomDeviceContainer(
                    //     title: "Fan",
                    //     image: 'assets/images/fan_colored.png',
                    //     choice: 2,
                    //   ),
                    //   CustomDeviceContainer(
                    //     title: "Smart TV",
                    //     image: 'assets/images/responsive_colored.png',
                    //     choice: 3,
                    //   ),
                    //],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Rooms(sendData: widget.sendData, recievedMessage: widget.recievedMessage,)),
                    );
                  },
                  child: CustomContainer(
                    title1: 'Room',
                    title2: "5 devices",
                    image: 'assets/images/room1.jpg',
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (_) => Halls()),
                //     );
                //   },
                //   child: CustomContainer(
                //     title1: 'Halls',
                //     title2: "2 Halls",
                //     image: 'assets/images/room2.jpg',
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => GarageScreen(
                              recievedMessage: widget.recievedMessage,
                              sendData: widget.sendData,
                            ),
                      ),
                    );
                  },
                  child: CustomContainer(
                    title1: 'Garage',
                    title2: "2 Cars",
                    image: 'assets/images/garage.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GardenScreen(sendData: widget.sendData, recievedMessage: widget.recievedMessage,),
                      ),
                    );
                  },
                  child: CustomContainer(
                    title1: 'Garden',
                    title2: "",
                    image: 'assets/images/garden.jpg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget btn({
  required String text,
  required Function() onTap,
  required Color btnColor,
  required Color textColor,
  required double btnWidth,
}) {
  return AnimatedButton(
    onPressed: onTap,
    color: btnColor,
    width: btnWidth,
    height: 50,
    shadowDegree: ShadowDegree.dark,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
