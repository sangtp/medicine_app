import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_app/theme.dart';

import '../models/user.dart' as User;
import '../user_references.dart';
import '../widgets/profile_widget.dart';

import '../widgets/textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final user = UserReferences.myUser;
  final user1 = FirebaseAuth.instance.currentUser!;
  File? imageFile;
  String? imageUrl;
  UserCredential? authResult;
  final userData = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Please choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getImageFormCamera();
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera_alt,
                        color: greenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      'Camera',
                      style: boldTextStyle.copyWith(color: lightGreenColor),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  //get image from gallery
                  _getImageFormGallery();
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.image,
                        color: greenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      'Gallery',
                      style: boldTextStyle.copyWith(color: lightGreenColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _getImageFormCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    _cropImage(pickedFile!.path);
  }

  void _getImageFormGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    _cropImage(pickedFile!.path);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: greenColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              if (imageFile == null) {
                Fluttertoast.showToast(msg: 'Please select an Image');
                return;
              }

              try {
                final ref = FirebaseStorage.instance
                    .ref()
                    .child('userImages')
                    .child(DateTime.now().toString() + ' - ${user1.uid}.png');
                await ref.putFile(imageFile!);
                imageUrl = await ref.getDownloadURL();

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user1.uid)
                    .update({
                  'userImage': imageUrl,
                });

                Navigator.canPop(context) ? Navigator.pop(context) : null;
              } on FirebaseAuthException catch (error) {
                var message =
                    'An error occurred, please check your credentials!';
                if (error.message != null) {
                  message = error.message!;
                }
              } catch (error) {
                Fluttertoast.showToast(msg: error.toString());
              }
            },
            icon: const Icon(Icons.check),
            color: greenColor,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          if (user1.email == 'admin@admin.com')
            ProfileWidget(
              imageUrl: 'assets/images/admin_avatar.png',
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => EditProfileScreen(),
                //   ),
                // );
              },
            ),
          if (user1.email != 'admin@admin.com')
            imageFile == null
                ? ProfileWidget(
                    imageUrl: 'assets/images/avatar.png',
                    isEdit: true,
                    onTap: _showImageDialog,
                  )
                : CircleAvatar(
                    radius: 90,
                    backgroundImage: Image.file(imageFile!).image,
                  ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Full Name',
            text:
                user1.email == 'admin@admin.com' ? 'Administrator' : user1.uid,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Email',
            text: user1.email,
            onChanged: (email) {
              email = user1.email!;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          if (user1.email != 'admin@admin.com')
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 10,
              onChanged: (name) {},
            ),
          if (user1.email == 'admin@admin.com')
            TextFieldWidget(
              label: 'About',
              text: 'Admin',
              maxLines: 10,
              onChanged: (name) {},
            ),
        ],
      ),
    );
  }
}
