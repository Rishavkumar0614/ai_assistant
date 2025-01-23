// import 'package:flutter/material.dart';
// import 'package:ai_assistant/commons.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ai_assistant/views/widgets/chat_message.dart';
// import 'package:ai_assistant/services/gemini/gemini_service.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({
//     super.key,
//     required this.chatId,
//   });
//   final int chatId;

//   @override
//   State<ChatScreen> createState() => ChatScreenState(chatId: chatId);
// }

// class ChatScreenState extends State<ChatScreen> {
//   bool flag = true;
//   final int chatId;
//   final int serviceId = 0;
//   ChatScreenState({required this.chatId});
//   final TextEditingController _controller = TextEditingController();
//   void _sendMessage() async {
//     try {
//       if (_controller.text.isNotEmpty) {
//         flag = false;
//         String text = _controller.text;
//         _controller.clear();
//         await chatController.saveMessage(
//             serviceId, chatId, user.nMessages(serviceId, chatId), text, 'SENT');
//         setState(() {});
//         Map<String, dynamic> response =
//             await GeminiService().generateContent(text);
//         await chatController.saveMessage(serviceId, chatId,
//             user.nMessages(serviceId, chatId), response['content'], 'RECEIVED');
//         setState(() {
//           flag = true;
//         });
//       } else {
//         showSnackBar('Please enter a message', 2);
//       }
//     } catch (e) {
//       showSnackBar('Something went wrong', 2);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenContext = context;
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'Conversation ${chatId + 1}',
//             style: GoogleFonts.ibmPlexSans(fontSize: 20),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: user.nMessages(serviceId, chatId),
//               itemBuilder: (context, index) {
//                 return ChatMessageWidget(
//                   message: user.getChatMessage(serviceId, chatId, index)!,
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: 'Type Your Message...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       prefixIcon: const Icon(Icons.message),
//                       hintStyle: GoogleFonts.ibmPlexSans(fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     if (flag) {
//                       _sendMessage();
//                     }
//                   },
//                   icon: const Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
