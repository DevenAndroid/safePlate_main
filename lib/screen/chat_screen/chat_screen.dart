// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//   static final route = "/chatScreen";
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 0,
//         titleSpacing: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xff75D051),
//         title: Row(
//           children: [
//
//           IconButton(
//             onPressed: (){
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back,color: Colors.white,
//             ),
//           ),
//             const SizedBox(width: 10,),
//             Column(crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Shashi Kumar", style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color:Colors.white),),
//                Row(
//                  children: [
//                    SvgPicture.asset("assets/images/Ellipse 204.svg"),
//
//                    SizedBox(width: 10,),
//                    Text("Online")
//                  ],
//                ),
//
//               ],
//             ),
//             Spacer(),
//            Icon(Icons.more_vert)
//           ],
//         ),
//
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset("assets/images/Ellipse 63.svg",height: 30,),
//               SizedBox(width: 20,),
//               Container(
//                 // margin: EdgeInsets.symmetric(horizontal: 10),
//                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//                 decoration: BoxDecoration(
//                   boxShadow: [
//               //BoxShadow
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: const Offset(0.0, 0.0),
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ), //BoxShadow
//                   ],
//
//                 ),
//                 child: Row(children: [
//                   Text("Sure, let me know when you’ll be free!"),
//                 ],),
//               )
//             ],
//           )
//         ],
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {

   static final route = "/chatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Sure, let me know when you\'ll be\nfree!',
      isSentByMe: false,
      time: '02.52',
    ),
    ChatMessage(
      text: 'Hi Shashi, good morning!!',
      isSentByMe: true,
      time: '',
    ),
    ChatMessage(
      text: 'Halo! Good Morning, whats up\nman?',
      isSentByMe: false,
      time: '05.52',
    ),
    ChatMessage(
      text: 'Sorry to bother, Can I ask you\nfor a help today?',
      isSentByMe: true,
      time: '',
    ),
    ChatMessage(
      text: 'Of course, what can i help you\nwith?',
      isSentByMe: false,
      time: '07:40',
    ),
    ChatMessage(
      text: 'Ok Thank You So Much',
      isSentByMe: true,
      time: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff75D051),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [

            IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,color: Colors.white,
              ),
            ),
              const SizedBox(width: 10,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shashi Kumar", style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color:Colors.white),),
                  SizedBox(height: 10,),
                 Row(
                   children: [
                     SvgPicture.asset("assets/images/Ellipse 204.svg"),

                     SizedBox(width: 10,),
                     Text("Online",style: GoogleFonts.roboto(
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         color:Color(0xffE5F4EF)),)
                   ],
                 ),

                ],
              ),
              Spacer(),
             Icon(Icons.more_vert)
            ],
          ),
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  message: _messages[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green,width: 2),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: TextFormField(


                          decoration: InputDecoration(

                              hintText: 'Type a message',
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.roboto(
                                  fontSize:19,
                                  fontWeight:FontWeight.w400
                              )

                          ),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/Emojis.svg"),
                  SizedBox(width: 15,),
                  SvgPicture.asset("assets/icons/Send.svg")
                ],
              ),
            ),
          ),
SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;

  ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe)
            Image(image: AssetImage("assets/setting/Ellipse 63.png")),
          SizedBox(width: 18),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blue[200] : Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: isSentByMe ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                if (time.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSentByMe ? Colors.white : Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (isSentByMe)
            Image(image: AssetImage("assets/setting/Profile.png"))
        ],
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSentByMe)
            Image(image: AssetImage("assets/setting/Ellipse 63.png")),
          SizedBox(width: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: message.isSentByMe ? Color(0xff75D051) : Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: message.isSentByMe ? Colors.white : Colors.black,
                    fontSize: 13.0,
                  ),
                ),
                if (message.time.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      message.time,
                      style: TextStyle(
                        color: message.isSentByMe ? Colors.white : Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
SizedBox(width: 8,),

          if (message.isSentByMe)
          Image(image: AssetImage("assets/setting/Profile.png"))
        ],
      ),
    );
  }
}