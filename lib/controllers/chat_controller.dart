// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:ai_assistant/commons.dart';
// import 'package:ai_assistant/models/chat_message.dart';

// class ChatController {
//   Future<List<int>> fetchChats(int serviceid) async {
//     try {
//       if (user.isServiceRegistered(serviceid)) {
//         final response = await http.post(
//           Uri.parse('http://localhost:3000/services/chat/fetchChats'),
//           body: jsonEncode({
//             'serviceid': serviceid,
//             'userid': user.getUserId(),
//           }),
//         );
//         if (response.statusCode == 200) {
//           switch (response.body) {
//             case 'SOMETHING WENT WRONG':
//               showSnackBar('Something went wrong', 2);
//               return [];
//             default:
//               List<dynamic> $response = jsonDecode(response.body);
//               List<int> chatids = [];
//               for (int i = 0; i < $response.length; i++) {
//                 chatids.add($response[i]['chatid']!);
//               }
//               return chatids;
//           }
//         } else {
//           showSnackBar('Inavlid Response', 2);
//           return [];
//         }
//       }
//     } catch (e) {
//       showSnackBar('Something went wrong', 2);
//       return [];
//     }
//     return [];
//   }

//   Future<List<ChatMessage>> fetchMessages(int serviceid, int chatid) async {
//     try {
//       if (user.isServiceRegistered(serviceid)) {
//         final response = await http.post(
//           Uri.parse('http://localhost:3000/services/chat/fetchMessages'),
//           body: jsonEncode({
//             'chatid': chatid,
//             'serviceid': serviceid,
//             'userid': user.getUserId(),
//           }),
//         );
//         if (response.statusCode == 200) {
//           switch (response.body) {
//             case 'SOMETHING WENT WRONG':
//               showSnackBar('Something went wrong', 2);
//               return [];
//             default:
//               List<dynamic> $response = jsonDecode(response.body);
//               List<ChatMessage> messages = [];
//               for (int i = 0; i < $response.length; i++) {
//                 messages.add(ChatMessage(
//                     text: $response[i]['content']!,
//                     isError: false,
//                     isSentByUser:
//                         ($response[i]['status'] == 'SENT') ? true : false,
//                     userid: user.getUserId(),
//                     serviceid: serviceid,
//                     chatid: chatid,
//                     messageid: $response[i]['messageid']!));
//               }
//               return messages;
//           }
//         } else {
//           showSnackBar('Inavlid Response', 2);
//           return [];
//         }
//       }
//     } catch (e) {
//       showSnackBar('Something went wrong', 2);
//       return [];
//     }
//     return [];
//   }

//   Future<void> saveMessage(int serviceid, int chatid, int messageid,
//       String message, String status) async {
//     try {
//       if (user.isServiceRegistered(serviceid)) {
//         final response = await http.post(
//           Uri.parse('http://localhost:3000/services/chat/saveMessage'),
//           body: jsonEncode({
//             'chatid': chatid,
//             'status': status,
//             'content': message,
//             'serviceid': serviceid,
//             'messageid': messageid,
//             'userid': user.getUserId(),
//           }),
//         );
//         if (response.statusCode == 200) {
//           switch (response.body) {
//             case 'SOMETHING WENT WRONG':
//               showSnackBar('Something went wrong', 2);
//             case 'MESSAGE SAVED':
//               showSnackBar('Message Saved', 2);
//               user.insertChatMessage(
//                   serviceid,
//                   chatid,
//                   ChatMessage(
//                       text: message,
//                       isError: false,
//                       isSentByUser: (status == 'SENT') ? true : false,
//                       serviceid: serviceid,
//                       userid: user.getUserId(),
//                       chatid: chatid,
//                       messageid: user.nMessages(serviceid, chatid)));
//           }
//         } else {
//           showSnackBar('Invalid Response', 2);
//         }
//       }
//     } catch (e) {
//       showSnackBar('Something went wrong', 2);
//     }
//   }
// }
