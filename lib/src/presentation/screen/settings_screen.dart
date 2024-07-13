import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t89/src/presentation/widgets/%20cantainer_add_pr_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = false;
  String companyName = "Company Name";
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        title: const Row(
          children: [
            Icon(
              Icons.settings,
              color: Color(0xFFE0966D),
            ),
            SizedBox(width: 15),
            Text(
              'SETTINGS',
              style: TextStyle(
                color: Color(0xFFE0966D),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _showEditCompanyNameDialog(context);
              },
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: _imageFile != null
                            ? FileImage(_imageFile!)
                            : const NetworkImage(
                                "https://via.placeholder.com/75x75"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 47,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF6F6F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              companyName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.edit,
                            color: Color(0xFFE0966D),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                setState(() {
                  _switchValue = !_switchValue;
                });
              },
              child: buildSettingOption(
                context,
                title: 'Notifications',
                trailing: Switch(
                  activeTrackColor: Colors.green,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                iconPath: 'assets/icons/notification.svg',
              ),
            ),
            const SizedBox(height: 15),
            buildSettingOption(
              context,
              title: 'Rate Us',
              trailing: const Icon(Icons.chevron_right),
              iconPath: 'assets/icons/like.svg',
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                _showFeedbackDialog(context);
              },
              child: buildSettingOption(
                context,
                title: 'Feedback',
                trailing: const Icon(Icons.chevron_right),
                iconPath: 'assets/icons/like.svg',
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                _showDeleteProfileDialog(context);
              },
              child: buildSettingOption(
                context,
                title: 'Delete Profile',
                titleColor: const Color(0xFFF64040),
                backgroundColor: const Color(0xFFFFE6E6),
                trailing: const Icon(Icons.chevron_right),
                iconPath: 'assets/icons/del.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingOption(BuildContext context,
      {required String title,
      Color titleColor = const Color(0xFF262A46),
      Color backgroundColor = const Color(0xFFF6F6F6),
      Widget? trailing,
      required String iconPath}) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 26,
            height: 26,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }

  void _showEditCompanyNameDialog(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: companyName);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Company Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: _pickImage,
                    child: SvgPicture.asset('assets/icons/addfoto.svg')),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 44,
                        width: 145,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF262A46)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xFF535778),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 1),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          companyName = nameController.text;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 44,
                        width: 145,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF262A46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Share your feedback',
            style: TextStyle(
              color: Color(0xFF535778),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Do you enjoy using APP NAME? What can we do to improve your experience?',
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 315,
                height: 142,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Describe your experience or suggestions',
                    hintStyle: TextStyle(
                      color: const Color(0xFF535778).withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF535778),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: null,
                ),
              )
            ],
          ),
          actions: const [
            CantainerAddPr(
              text1: 'Cancel',
              text2: 'Save',
              colors: Color(0xFF262A46),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Are you sure want to delete profile?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF535778),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: const Opacity(
            opacity: 0.50,
            child: Text(
              'This will completely and irrevocably delete your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF535778),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: const [
            CantainerAddPr(
              text1: 'Cancel',
              text2: 'Save',
              colors: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
