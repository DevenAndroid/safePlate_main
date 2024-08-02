import 'dart:developer';
import 'package:Safeplate/repo/allfamily_member_repo.dart';
import 'package:Safeplate/repo/delete_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/screen/add_familymember_screen.dart';
import '../../model/allfamily_member_model.dart';
import '../../widget/helper.dart';

class AllFamilyMember extends StatefulWidget {
  const AllFamilyMember({super.key});
  static var route = "/addNewMember";

  @override
  State<AllFamilyMember> createState() => _AllFamilyMemberState();
}

class _AllFamilyMemberState extends State<AllFamilyMember> {
  Rx<RxStatus> statusOfFamilyMember = RxStatus.empty().obs;
  Rx<FamilyMemberModel> family = FamilyMemberModel().obs;


  allFamily(){
    allFamilyMemberRepo().then((value) {
      log("response.body.....    ${value}");
      family.value = value;
      if (value.success == true) {
        statusOfFamilyMember.value = RxStatus.success();
        showToast(value.message);
        print("11111111111111111111111${value.message.toString()}");
      } else {
        showToast(value.message);
        print("222222222222222222222222${value.message.toString()}");
        statusOfFamilyMember.value = RxStatus.error();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    allFamily();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffEF535E),
          onPressed: () {
            Get.toNamed(AddFamilyMember.route);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: const Color(0xff75D051),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "My Family Member",
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Obx(() {
              return statusOfFamilyMember.value.isSuccess
                  ? Column(
                children: [
                  family.value.membersdata!.length.toString() == 0?
                  ListView.builder(
                    itemCount: family.value.membersdata!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // dense: true,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/user.png"),
                        ),
                        title: Text(
                          family.value.membersdata![index].name ?? "",
                          // "Bryan Williams",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          family.value.membersdata![index].relationship ??
                              "",
                          // "Husband",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        trailing: SizedBox(
                          width: width * 0.15,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icons/edit.png",
                                    height: 20,
                                    width: 20,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    deleteRepo(
                                        email: family.value
                                            .membersdata![index].email,
                                        context: context) .then(
                                            (value) async {
                                          if (value.success == true) {
                                            showToast(value.message);
                                            allFamily();
                                          } else {
                                            showToast(value.message);
                                          }
                                        });
                                  },
                                  child: Image.asset(
                                    "assets/icons/delete.png",
                                    height: 20,
                                    width: 20,
                                  ))
                              // IconButton(onPressed: onPressed, icon: icon)
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : Center(child: Text("No Family Member Available"),)
                ],
              )
                  : const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                  ));
            })








          ),
        ),
      ),
    );
  }

  // Future<void> removeMember() async {
  //   var headers = {
  //     'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YWM4NmIyNmFkZjM0OTYyMTE4YjBiYyIsInJvbGUiOiJ1c2VyIiwiZGlzYWJsZWQiOmZhbHNlLCJpYXQiOjE3MjI1ODc0NzEsImV4cCI6MTcyMzc5NzA3MX0.OUgUd3X-_8HafKzLODPb-pdBHDPgYmOJnntrJnpMD2M'
  //   };
  //   var request = http.Request(
  //       'DELETE',
  //       Uri.parse('https://safegate.webdemozone.com/api/v1/removemember?membersemail=rahul@gmail.com')
  //   );
  //
  //   request.headers.addAll(headers);
  //
  //   try {
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       print(await response.stream.bytesToString());
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //   }
  // }
}
