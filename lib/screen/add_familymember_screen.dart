import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Safeplate/resources/dimension.dart';
import 'package:Safeplate/widget/custom_textfield.dart';

class AddFamilyMember extends StatefulWidget {
  const AddFamilyMember({super.key});
  static var route = "/addFamilyMember";

  @override
  State<AddFamilyMember> createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {

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
    return  Scaffold(
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
        title: Text("Add New Family Member", style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.white),),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: Get.height*0.01,),

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
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 30),
              //   child:
              //   Center(
              //     child: SvgPicture.asset("assets/images/Ellipse 1573.svg"),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const EditProfileTextFieldWidget(
                      hint: "Enter Your Name",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const EditProfileTextFieldWidget(
                      hint: "Enter Your Email",
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
                    const EditProfileTextFieldWidget(
                      hint: "+91 : 9876543210",
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        onPressed: () async {
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
    );
  }
}
 