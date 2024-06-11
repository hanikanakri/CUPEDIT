import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class InboxCardCustom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InboxCardCustom({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.0, // Set elevation to 0.0

        color: Colors.white, // Set the desired background color

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.edit),
                    const Expanded(
                      child: Text("System Notification",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      "03:18",
                      style: TextStyle(fontSize: 11, color: AppColors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(title,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 8,
                ),
                Text(subtitle,
                    style: TextStyle(fontSize: 11, color: AppColors.grey)),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("View more",
                        style: TextStyle(
                            fontSize: 11,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700)),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ]),
        ));
  }
}

class MyCard extends StatelessWidget {
  final List<Map<String, String>> dataList;

  const MyCard({Key? key, required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final title = dataList[index]['title'];
        final subtitle = dataList[index]['subtitle'];

        return InboxCardCustom(
          icon: Icons.person,
          title: title!,
          subtitle: subtitle!,
        );
      },
    );
  }
}
