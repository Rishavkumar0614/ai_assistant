import 'package:flutter/material.dart';
import 'package:ai_assistant/commons.dart';
// import 'package:ai_assistant/models/chat_message.dart';

List<Widget> services = [
  // const gemini_home_screen.HomeScreen(),
];

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  int activeServiceIdx = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // await chatController.fetchRegisteredServices();
    // List<int> registeredServices = user.getRegisteredServices();
    // for (int i = 0; i < registeredServices.length; i++) {
    //   List<int> chatids =
    //       await chatController.fetchChats(registeredServices[i]);
    //   for (int j = 0; j < chatids.length; j++) {
    //     user.createNewChat(registeredServices[i]);
    //     List<ChatMessage> messages = await chatController.fetchMessages(
    //         registeredServices[i], chatids[j]);
    //     for (int k = 0; k < messages.length; k++) {
    //       user.insertChatMessage(
    //           registeredServices[i], chatids[j], messages[k]);
    //     }
    //   }
    // }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    currentScreenContext = context;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < services.length; i++)
                InkWell(
                  onTap: () {
                    activeServiceIdx = i;
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: (activeServiceIdx == i)
                                ? const Color.fromARGB(255, 66, 133, 244)
                                : Colors.white),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: servicesLogo[i],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: (activeServiceIdx >= 0) ? services[activeServiceIdx] : null,
    );
  }
}
