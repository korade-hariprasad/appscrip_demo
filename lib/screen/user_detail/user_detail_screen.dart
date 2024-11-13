import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchWebsite(String url) async {
    final Uri webUri = Uri.parse(url.startsWith('http') ? url : 'http://$url');
    if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri);
    }
  }

  void _launchMap(String lat, String lng) async {
    final Uri mapUri =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Colors.transparent)),
                  childrenPadding: const EdgeInsets.all(10),
                  title: Text("Personal Details"),
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blueAccent),
                        SizedBox(width: 8),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name),
                            Text(user.username),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () =>
                          _launchEmail(user.email.toLowerCase()),
                      child: Row(
                        children: [
                          Icon(Icons.email, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(user.email.toLowerCase()),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () => _launchPhone(user.phone),
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(user.phone),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () => _launchWebsite(user.website),
                      child: Row(
                        children: [
                          Icon(Icons.web, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(user.website),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Colors.transparent),),
                  childrenPadding: const EdgeInsets.all(10),
                  title: const Text("Company Details"),
                  children: [
                    Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text("Name:"),
                            Text(user.company.name),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Business:\t\t"),
                            Text(user.company.bs),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Address:"),
                            Text(
                              "${user.address.suite}, ${user.address.street}, ${user.address.city}\n${user.address.zipcode}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
