import 'dart:developer';
import 'package:Safeplate/repo/allfamily_member_repo.dart';
import 'package:Safeplate/repo/delete_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Safeplate/screen/settings/add_familymember_screen.dart';
import '../../model/allfamily_member_model.dart';
import '../../model/common_model.dart';
import '../../widget/helper.dart';
import 'family_member_edit.dart';

class AllFamilyMember extends StatefulWidget {
  const AllFamilyMember({super.key});
  static var route = "/addNewMember";

  @override
  State<AllFamilyMember> createState() => _AllFamilyMemberState();
}

class _AllFamilyMemberState extends State<AllFamilyMember> {
  Rx<RxStatus> statusOfFamilyMember = RxStatus.empty().obs;
  Rx<FamilyMemberModel> family = FamilyMemberModel().obs;

  Rx<RxStatus> statusOfdelete = RxStatus.empty().obs;
  Rx<CommonModel> deleteMember = CommonModel().obs;

  delete(email){
    deleteRepo(
        email: email,
        context: context) .then(
            (value) async {
          if (value.success == true) {
            // statusOfdelete.value.isSuccess?
            // showToast(value.message):
            // CircularProgressIndicator();
            showToast(value.message);
            allFamily();
          } else {
            showToast(value.message);
          }
        });
  }

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
                  family.value.membersdata!.isEmpty?

                       Center(child: Text("No Family Member Available"),) :
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
                                  onTap: () {
                                    Get.to(()=>FamilyMemberEdit(email:family.value.membersdata![index].email));
                                    // Get.toNamed(FamilyMemberEdit.route,
                                    //     arguments:family.value.membersdata![index].email);
                                  // Get.to( const FamilyMemberEdit(key: ));
                                    // showCustomPersistentBottomSheet(context);
                                  },
                                  child: Image.asset(
                                    "assets/icons/edit.png",
                                    height: 20,
                                    width: 20,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    delete( family.value.membersdata![index].email);
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





}
