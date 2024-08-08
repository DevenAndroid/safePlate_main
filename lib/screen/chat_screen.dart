import 'package:Safeplate/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/profile_controller.dart';

class ChatScreen extends StatefulWidget {

  static const route = "/chatScreen";
  String?name;
  String?health;
  String?age;
  String?weight;
  String?Gender;

   ChatScreen({super.key,this.name,this.age,this.health,this.weight,this.Gender});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyCiDGfFN-tCfYrF52weQZ0Lbv8_UcmNbA4";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];
  String? _userName;


  final profileController = Get.put(ProfileController());

  Future<void> sendMessage({String? message}) async {
    final userMessage = message ?? _userInput.text;

    if (userMessage.isNotEmpty) {
      setState(() {
        _messages.add(Message(isUser: true, message: userMessage, date: DateTime.now()));
      });
      if (message == null) _userInput.clear();

      try {
        // Process AI response
        final content = [Content.text(userMessage)];
        final response = await model.generateContent(content);

        setState(() {
          _messages.add(Message(
              isUser: false,
              message: response.text ?? "Sorry, I didn't get that.",
              date: DateTime.now()));
        });
      } catch (e) {
        setState(() {
          _messages.add(Message(
              isUser: false,
              message: "Error: ${e.toString()}",
              date: DateTime.now()));
        });
      }
    }
  }
  Future<void> dataLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _userName = pref.getString("name")?.replaceAll('""', '') ?? "User";
    });
  }


  @override
  void initState() {
    super.initState();
    dataLogin();
    print("object${widget.name.toString()}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await profileController.getProfile();
      if (profileController.profile.value.user != null) {

        print("object>>>>>");
        sendMessage(
            message:
            "My name: ${widget.name.toString()},\n "
                "My age: ${widget.age.toString()},\n "
                "My Health issue: ${widget.health.toString()}, "
                "My weight: ${widget.weight.toString()},\n "

                "My Gender: ${widget.Gender.toString()}\n"
        );
      }
      else{
        print("object");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff75D051),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios, color: Colors.white,
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userName ?? "User",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Ellipse 204.svg"),
                      const SizedBox(width: 10,),
                      Text(
                        "Online",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffE5F4EF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _userInput,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(12),
                  iconSize: 30,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: () {
                    sendMessage();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({
    required this.isUser,
    required this.message,
    required this.date,
  });
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xff75D051) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: isUser ? const Radius.circular(10) : Radius.zero,
          bottomLeft: const Radius.circular(10),
          topRight: const Radius.circular(10),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            offset: const Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 10,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
