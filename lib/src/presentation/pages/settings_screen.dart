import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.settings, color: Color(0xFFE0966D)),
              SizedBox(width: 15),
              Text(
                'SETTINGS',
                style: TextStyle(
                  color: Color(0xFFE0966D),
                  fontSize: 22,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Company Name and Logo
            Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/75x75"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 47,
                    padding: const EdgeInsets.all(15),
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
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Company Name',
                            style: TextStyle(
                              color: Color(0xFF262A46),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Opacity(
                          opacity: 0.20,
                          child: Icon(Icons.edit, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Notifications
            buildSettingOption(
              context,
              title: 'Notifications',
              trailing: Switch(value: true, onChanged: (value) {},),
              iconPath: 'assets/icons/notification.svg',
            ),
            const SizedBox(height: 15),
            // Rate Us
            buildSettingOption(
              context,
              title: 'Rate Us',
              trailing: const Icon(Icons.chevron_right,),
              iconPath: 'assets/icons/like.svg',
            ),
            const SizedBox(height: 15),
            // Feedback
            buildSettingOption(
              context,
              title: 'Feedback',
              trailing: const Icon(Icons.chevron_right),
              iconPath: 'assets/icons/like.svg',
            ),
            const SizedBox(height: 15),
            // Delete Profile
            buildSettingOption(
              context,
              title: 'Delete Profile',
              titleColor: const Color(0xFFF64040),
              backgroundColor: const Color(0xFFFFE6E6),
              trailing: const Icon(Icons.chevron_right),
              iconPath: 'assets/icons/del.svg',
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
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
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
