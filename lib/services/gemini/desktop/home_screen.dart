// import 'package:flutter/material.dart';
// import 'package:ai_assistant/commons.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ai_assistant/services/gemini/desktop/chat_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen> {
//   final int serviceid = 0;

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   Future<void> init() async {
//     await chatController.registerService(serviceid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenContext = context;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Conversations',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 hintStyle: GoogleFonts.ibmPlexSans(fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Recent Conversations',
//               style: GoogleFonts.ibmPlexSans(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 66, 133, 234),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: user.nChats(serviceid),
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ChatScreen(
//                             chatId: index,
//                           ),
//                         ),
//                       );
//                       setState(() {});
//                     },
//                     child: ListTile(
//                       title: Text(
//                         'Conversation ${index + 1}',
//                         style: GoogleFonts.ibmPlexSans(fontSize: 16),
//                       ),
//                       leading: const Icon(
//                         Icons.chat,
//                         size: 30,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   ChatScreen(chatId: user.createNewChat(serviceid)),
//             ),
//           );
//           setState(() {});
//         },
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }
