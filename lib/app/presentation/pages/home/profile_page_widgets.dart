import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserItemTile extends StatelessWidget {
  const UserItemTile({
    super.key,
    required this.userName,
    required this.userAccount,
    this.userImageAsset = 'assets/images/user_image.png',
  });

  final String userName;
  final String userAccount;
  final String userImageAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CircleAvatar(
            minRadius: 48,
            backgroundImage: AssetImage(
              userImageAsset,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userAccount,
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileFeatureItem extends StatelessWidget {
  const ProfileFeatureItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onItemPressed,
    this.onIconPressed,
  });
  final void Function()? onItemPressed;
  final void Function()? onIconPressed;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 50,
              offset: Offset(0, 0),
              spreadRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onIconPressed,
              child: const Icon(Icons.keyboard_arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
