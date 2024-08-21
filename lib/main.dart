import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For copying to the clipboard
import 'package:flutter/widgets.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final client = StreamVideo(
    'mmhfdzb5evj2',
    user: User.regular(
      userId: 'Darth_Nihilus',
      role: 'admin',
      name: 'John Doe',
    ),
    userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRGFydGhfTmloaWx1cyIsImlzcyI6Imh0dHBzOi8vcHJvbnRvLmdldHN0cmVhbS5pbyIsInN1YiI6InVzZXIvRGFydGhfTmloaWx1cyIsImlhdCI6MTcyNDE1ODM0MywiZXhwIjoxNzI0NzYzMTQ4fQ.DtPFdqKgUQhTwJUjc1z67M-Mr57AQ-TKbjW8gGP7fwY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Conference',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _meetingNameController = TextEditingController();
  final TextEditingController _participantsNumberController = TextEditingController();
  final TextEditingController _meetingIdController = TextEditingController();
  final Uuid _uuid = Uuid();

  // A map to store the meeting IDs and their associated names
  final Map<String, String> _meetingDetails = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 85, 123),
        title: Center(child: const Text("Meeting",style: TextStyle(color: Colors.white),)),
      ),
      body:  Padding(
          padding: const EdgeInsets.only(left:28.0, right: 28.0,top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewMeeting(
                        
                      ),
                    ),
                  );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange,
                        ),
                        child: Icon(Icons.video_call, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("New meeting")
                  ],
                ),
                SizedBox(width:50),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Join screen
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinMeeting(
                        
                      ),
                    ),
                  );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.group, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Join")
                  ],
                ),
                SizedBox(width:50),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Schedule screen
                        Navigator.pushNamed(context, '/schedule');
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.schedule, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Schedule")
                  ],
                ),
                SizedBox(width:50),
              
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Share Screen screen
                        Navigator.pushNamed(context, '/shareScreen');
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.screen_share, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Share screen")
                  ],
                )
              ],
              ),
              // TextField(
              //   controller: _meetingNameController,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Meeting Name',// new meeting ,join,schedule,share screen
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // TextField(
              //   controller: _participantsNumberController,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Number of Participants',
              //     border: OutlineInputBorder(),
              //   ),
              //   keyboardType: TextInputType.number,
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   child: const Text('Create Call'),
              //   onPressed: () async {
              //     // Validate inputs
              //     String meetingName = _meetingNameController.text.trim();
              //     int? maxParticipants = int.tryParse(_participantsNumberController.text.trim());
          
              //     if (meetingName.isEmpty || maxParticipants == null || maxParticipants <= 0) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Please enter valid meeting details')),
              //       );
              //       return;
              //     }
          
              //     // Generate a unique ID for the call
              //     String uniqueCallId = _uuid.v4();
          
              //     // Store the meeting details
              //     _meetingDetails[uniqueCallId] = meetingName;
          
              //     // Navigate to the screen that displays the Meeting ID
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => DisplayMeetingIdScreen(
              //           meetingId: uniqueCallId,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(height: 20),
              // TextField(
              //   controller: _meetingIdController,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Meeting ID',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   child: const Text('Join Call'),
              //   onPressed: () async {
              //     try {
              //       String enteredMeetingId = _meetingIdController.text.trim();
          
              //       if (enteredMeetingId.isEmpty) {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           const SnackBar(content: Text('Please enter a valid Meeting ID')),
              //         );
              //         return;
              //       }
          
              //       var call = StreamVideo.instance.makeCall(
              //         callType: StreamCallType(),
              //         id: enteredMeetingId,
              //       );
          
              //       await call.getOrCreate();
          
              //       // Get the meeting name associated with the entered ID
              //       String? meetingName = _meetingDetails[enteredMeetingId];
          
              //       // Navigate to the call screen
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => CallScreen(
              //             call: call,
              //             meetingName: meetingName,
              //           ),
              //         ),
              //       );
              //     } catch (e) {
              //       debugPrint('Error joining call: $e');
              //       debugPrint(e.toString());
              //     }
              //   },
              // ),
              SizedBox(height: 150,),
              Padding(
                padding: EdgeInsets.only(top:28.0),
                child: Column(
                  children: [
                    Text("No upcoming meetings here",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("The scheduled meetings will be listed here!")
                  ],
                ),
                )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // To show all 6 items
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
          
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      
    );
  }
}

class DisplayMeetingIdScreen extends StatelessWidget {
  final String meetingId;

  const DisplayMeetingIdScreen({Key? key, required this.meetingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting ID'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Meeting ID is:',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: SelectableText(
                meetingId,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 46, 50, 81) ,
                      
                  textStyle: TextStyle(fontSize: 16,color: Colors.white), // Optional: set text style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // No border radius
                  ),
                                ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: meetingId));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Meeting ID copied to clipboard!')),
                );
              },
              child: const Text('Copy Meeting ID',style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 46, 50, 81) ,
                      
                  textStyle: TextStyle(fontSize: 16,color: Colors.white), // Optional: set text style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // No border radius
                  ),
                                ),
              onPressed: () {
                Navigator.pop(context); // Go back to the main page
              },
              child: const Text('Back',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

class CallScreen extends StatefulWidget {
  final Call call;
  final String? meetingName;
  final int? maxParticipants;

  const CallScreen({
    Key? key,
    required this.call,
    this.meetingName,
    this.maxParticipants,
  }) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meetingName ?? ''),
      ),
      body: StreamCallContainer(
          
        
        call: widget.call,
        callContentBuilder: (
          BuildContext context,
          Call call,
          CallState callState,
        ) {
          return StreamCallContent(
            call: call,
            callState: callState,
            callControlsBuilder: (
              BuildContext context,
              Call call,
              CallState callState,
            ) {
              final localParticipant = callState.localParticipant!;
              return StreamCallControls(
                options: [
                
                  CallControlOption(
                    icon: const Icon(Icons.chat_outlined),
                    onPressed: () {
                      // Open your chat window
                    },
                  ),
                  FlipCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  AddReactionOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleMicrophoneOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  LeaveCallOption(
                    call: call,
                    onLeaveCallTap: () {
                      call.leave();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  
  final TextEditingController _meetingIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  final Map<String, String> _meetingDetails = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 85, 123),
        title: Center(child: const Text("Join",style: TextStyle(color: Colors.white),)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 28,top: 10),
        child: Column(
          children: [
            TextField(
                  controller: _meetingIdController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Meeting ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 600,
                height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 46, 50, 81) ,
                      
                  textStyle: TextStyle(fontSize: 18,color: Colors.white), // Optional: set text style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // No border radius
                  ),
                                ),
                    child: const Text('Join Call',style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      try {
                        String enteredMeetingId = _meetingIdController.text.trim();
                              
                        if (enteredMeetingId.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a valid Meeting ID')),
                          );
                          return;
                        }
                              
                        var call = StreamVideo.instance.makeCall(
                          callType: StreamCallType(),
                          id: enteredMeetingId,
                        );
                              
                        await call.getOrCreate();
                              
                        // Get the meeting name associated with the entered ID
                        String? meetingName = _meetingDetails[enteredMeetingId];
                              
                        // Navigate to the call screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CallScreen(
                              call: call,
                              meetingName: meetingName,
                            ),
                          ),
                        );
                      } catch (e) {
                        debugPrint('Error joining call: $e');
                        debugPrint(e.toString());
                      }
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}


class NewMeeting extends StatefulWidget {
  const NewMeeting({super.key});

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  final TextEditingController _meetingNameController = TextEditingController();
  final TextEditingController _participantsNumberController = TextEditingController();
  final TextEditingController _meetingIdController = TextEditingController();
  final Uuid _uuid = Uuid();

  // A map to store the meeting IDs and their associated names
  final Map<String, String> _meetingDetails = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 85, 123),
        title: Center(child: const Text("Create meeting",style: TextStyle(color: Colors.white),)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:28.0, right: 28.0,top:10
        ),
        child: Column(
          children: [
            TextField(
                controller: _meetingNameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Meeting Name',// new meeting ,join,schedule,share screen
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _participantsNumberController,
                decoration: const InputDecoration(
                  labelText: 'Enter Number of Participants',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 600,
                height: 50,
                
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 50, 81) ,
                    
                textStyle: TextStyle(fontSize: 18), // Optional: set text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // No border radius
                ),
              ),
                  
                  
                  
                  child: const Text('Create Call',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  onPressed: () async {
                    // Validate inputs
                    String meetingName = _meetingNameController.text.trim();
                    int? maxParticipants = int.tryParse(_participantsNumberController.text.trim());
                          
                    if (meetingName.isEmpty || maxParticipants == null || maxParticipants <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter valid meeting details')),
                      );
                      return;
                    }
                          
                    // Generate a unique ID for the call
                    String uniqueCallId = _uuid.v4();
                          
                    // Store the meeting details
                    _meetingDetails[uniqueCallId] = meetingName;
                          
                    // Navigate to the screen that displays the Meeting ID
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayMeetingIdScreen(
                          meetingId: uniqueCallId,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 150),
              TextField(
                controller: _meetingIdController,
                decoration: const InputDecoration(
                  labelText: 'Enter Meeting ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 600,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 46, 50, 81) ,
                      
                  textStyle: TextStyle(fontSize: 18), // Optional: set text style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // No border radius
                  ),
                ),
                  child: const Text('Join Call',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    try {
                      String enteredMeetingId = _meetingIdController.text.trim();
                          
                      if (enteredMeetingId.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a valid Meeting ID')),
                        );
                        return;
                      }
                          
                      var call = StreamVideo.instance.makeCall(
                        callType: StreamCallType(),
                        id: enteredMeetingId,
                      );
                          
                      await call.getOrCreate();
                          
                      // Get the meeting name associated with the entered ID
                      String? meetingName = _meetingDetails[enteredMeetingId];
                          
                      // Navigate to the call screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CallScreen(
                            call: call,
                            meetingName: meetingName,
                          ),
                        ),
                      );
                    } catch (e) {
                      debugPrint('Error joining call: $e');
                      debugPrint(e.toString());
                    }
                  },
                ),
              ),

          ],
        ),
        ),
    );
  }
}







 



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:stream_video_flutter/stream_video_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final client = StreamVideo(
//     'mmhfdzb5evj2',
//     user: User.regular(
//       userId: 'Darth_Nihilus',
//       role: 'admin',
//       name: 'John Doe',
//     ),
//     userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRGFydGhfTmloaWx1cyIsImlzcyI6Imh0dHBzOi8vcHJvbnRvLmdldHN0cmVhbS5pbyIsInN1YiI6InVzZXIvRGFydGhfTmloaWx1cyIsImlhdCI6MTcyNDE1ODM0MywiZXhwIjoxNzI0NzYzMTQ4fQ.DtPFdqKgUQhTwJUjc1z67M-Mr57AQ-TKbjW8gGP7fwY',
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Video Conference',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _meetingNameController = TextEditingController();
//   final TextEditingController _participantsNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Center(child: Text("Video Conferencing")),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _meetingNameController,
//               decoration: const InputDecoration(
//                 labelText: 'Meeting Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _participantsNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Number of Participants',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               child: const Text('Create Call'),
//               onPressed: () async {
//                 try {
//                   if (_meetingNameController.text.isEmpty || _participantsNumberController.text.isEmpty) {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text('Error'),
//                           content: const Text('Meeting name and number of participants must not be empty.'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('OK'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                     return;
//                   }

//                   // Generate a unique meeting ID
//                   String meetingId = DateTime.now().millisecondsSinceEpoch.toString();

//                   // Create the call with the generated meeting ID
//                   var call = StreamVideo.instance.makeCall(
//                     callType: StreamCallType(),
//                     id: meetingId,
//                   );

//                   // Ensure the call is created or already exists
//                   var callState = await call.getOrCreate();

//                   if (callState == null) {
//                     throw 'Unable to create or find the call';
//                   }

//                   // Display the meeting ID to the user with a copy option
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: const Text('Meeting Created'),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text('Meeting ID: $meetingId'),
//                             const SizedBox(height: 16),
//                             ElevatedButton.icon(
//                               icon: const Icon(Icons.copy),
//                               label: const Text('Copy Meeting ID'),
//                               onPressed: () {
//                                 Clipboard.setData(ClipboardData(text: meetingId));
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Meeting ID copied to clipboard')),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } catch (e) {
//                   debugPrint('Error creating call: $e');
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               child: const Text('Join Call'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const JoinCallScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class JoinCallScreen extends StatefulWidget {
//   const JoinCallScreen({Key? key}) : super(key: key);

//   @override
//   State<JoinCallScreen> createState() => _JoinCallScreenState();
// }

// class _JoinCallScreenState extends State<JoinCallScreen> {
//   final TextEditingController _meetingIdController = TextEditingController();
//   final TextEditingController _participantNameController = TextEditingController();

//   Future<void> _joinCall() async {
//     try {
//       if (_meetingIdController.text.isEmpty || _participantNameController.text.isEmpty) {
//         _showErrorDialog('Meeting ID and participant name must not be empty.');
//         return;
//       }

//       // Attempt to retrieve the call with the given ID
//       var call = StreamVideo.instance.makeCall(
//         callType: StreamCallType(),
//         id: _meetingIdController.text,
//       );

//       var callState = await call.get();

//       if (callState == null) {
//         _showErrorDialog('The meeting ID you entered does not exist.');
//         return;
//       }

//       await call.join();

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CallScreen(call: call),
//         ),
//       );
//     } catch (e) {
//       debugPrint('Error joining call: $e');
//       _showErrorDialog('An error occurred while joining the call. Please try again.');
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Join Call'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _meetingIdController,
//               decoration: const InputDecoration(
//                 labelText: 'Meeting ID',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _participantNameController,
//               decoration: const InputDecoration(
//                 labelText: 'Your Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               child: const Text('Join Call'),
//               onPressed: _joinCall,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class CallScreen extends StatefulWidget {
//   final Call call;

//   const CallScreen({
//     Key? key,
//     required this.call,
//   }) : super(key: key);

//   @override
//   State<CallScreen> createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamCallContainer(
//         call: widget.call,
//         callContentBuilder: (
//           BuildContext context,
//           Call call,
//           CallState callState,
//         ) {
//           return StreamCallContent(
//             call: call,
//             callState: callState,
//             callControlsBuilder: (
//               BuildContext context,
//               Call call,
//               CallState callState,
//             ) {
//               final localParticipant = callState.localParticipant!;
//               return StreamCallControls(
//                 options: [
//                   CallControlOption(
//                     icon: const Icon(Icons.chat_outlined),
//                     onPressed: () {
//                       // Open chat window
//                     },
//                   ),
//                   FlipCameraOption(
//                     call: call,
//                     localParticipant: localParticipant,
//                   ),
//                   AddReactionOption(
//                     call: call,
//                     localParticipant: localParticipant,
//                   ),
//                   ToggleMicrophoneOption(
//                     call: call,
//                     localParticipant: localParticipant,
//                   ),
//                   ToggleCameraOption(
//                     call: call,
//                     localParticipant: localParticipant,
//                   ),
//                   LeaveCallOption(
//                     call: call,
//                     onLeaveCallTap: () {
//                       call.leave();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
