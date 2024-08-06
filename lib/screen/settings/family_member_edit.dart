import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../repo/family_member_edit_repo.dart';
import '../../resources/dimension.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/helper.dart';
import 'communityandmyposts.dart';

class FamilyMemberEdit extends StatefulWidget {

  String?email;

  FamilyMemberEdit({super.key, this.email});



  static var route = "/editNewMember";

  @override
  State<FamilyMemberEdit> createState() => _FamilyMemberEditState();
}

class _FamilyMemberEditState extends State<FamilyMemberEdit> {
  String?value='Mother';
  List<String> familyRelationship=['Mother','Father','Sister','Brother', ];


  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }
  }
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:false,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: const Color(0xff75D051),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,color: Colors.white,
          ),
        ),
        title: Text("Edit Family Member", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 54,
                    backgroundColor:const Color(0xff75D051) ,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        onTap: (){

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:26,vertical: 18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("Choose Any One:",style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color:Colors.black),),

                                      SizedBox(height: Get.height*0.04,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                _pickImageFromCamera();
                                                Get.back();
                                              },
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Icon(Icons.camera_rear),
                                                  Image.asset("assets/icons/camera.png",height: 24,width: 24,),
                                                  Text("Camera",style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color:Colors.black),),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                _pickImageFromGallery();
                                                Get.back();
                                              },
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Icon(Icons.browse_gallery),gallery
                                                  Image.asset("assets/icons/gallery.png",height: 24,width: 24,),
                                                  Text("Gallery",style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color:Colors.black),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: Get.height*0.04,),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                        },
                        child:
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child:
                          _image == null
                              ? Image.asset("assets/icons/addimage.png",fit: BoxFit.cover,)
                              : Image.file(_image!,fit: BoxFit.cover,),


                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(widget.email.toString(),  style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15),),
                      ),
                       SizedBox(height:10),

                      Text(
                        "Name",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        hint: "Enter Your Name",
                        controller: nameController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please Enter Name'.tr;
                          } else if (value.length >= 30) {
                            return 'Name cannot exceed 30 characters'.tr;
                          }
                          else if (RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])').hasMatch(value)) {
                            return 'Name is not accept in emoji'.tr;
                          }
                          return null;
                        },

                        // controller: nameController.,
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      Text(
                        "Phone Number",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      EditProfileTextFieldWidget(
                        textInputAction: TextInputAction.next,
                        hint: 'Enter Your Phone Number',
                        keyboardType: TextInputType.number,
                        controller: phonenumberController,
                        validator: (value) {
                          if (value!.isEmpty
                          // || RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$').hasMatch(value)
                          ) {
                            return "Phone number is required";
                          } else if  (value.length > 10) {
                            return 'number cannot exceed 10 characters'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Relationship",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropdownButtonFormField<String>(
                        value: value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffAFAFAF)),
                              borderRadius:
                              BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffAFAFAF)),
                              borderRadius:
                              BorderRadius.circular(10)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffAFAFAF)),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        items: familyRelationship.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        },
                      ),
                      // EditProfileTextFieldWidget(
                      //   hint: "Enter Your Relationship",
                      //   controller:relationshipController,
                      //   keyboardType: TextInputType.name,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Relationship is required";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                             if (_formKey.currentState!.validate()) {
                               familyMemberEditRepo(
                                  name: nameController.text,
                                  email: widget.email.toString(),
                                  phonenumber:phonenumberController.text,
                                  images:_image.toString() ,
                                  relationship:value.toString(), //relationshipController.text,
                                  context: context


                              ).then((value) {
                                if (value.success == true) {
                                  Get.to(()=>const AllFamilyMember() );
                                  print("data${value.message}");
                                  showToast(value.message);

                                }
                                else {
                                  print("data>>>>>>>");

                                  showToast(value.message);
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                            Size(AddSize.screenWidth, AddSize.size60),
                            backgroundColor: const Color(0xffFBB742),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text("Save".toUpperCase(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 20))),

                    ],
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
