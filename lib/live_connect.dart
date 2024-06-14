import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_doctor/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/whatsapp.dart';

final Uri _url = Uri.parse('https://wa.me/16693016557');

class LiveConnectPage extends StatefulWidget {
  const LiveConnectPage({super.key});

  @override
  State<LiveConnectPage> createState() => _LiveConnectPageState();
}

class _LiveConnectPageState extends State<LiveConnectPage> {
  WhatsApp whatsapp = WhatsApp();

  // final Uri launchUri = Uri(
  //     scheme: 'https',
  //     path: 'https://wa.me/16693016557', 
  //   );

  // Future<void> _launchInBrowser(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  // Future<void> _createChat() async {
  //   final Uri launchUri = Uri(
  //     scheme: 'https',
  //     path: 'https://wa.me/16693016557', 
  //   );
  //   await launchUrl(launchUri);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Connect'),
        backgroundColor: kColorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '''Need Expert’s Advice? 
You chose the right lifeline!''',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              '''Click the option below to chat with IGA about your queries. Feel free to send photos and videos to assist you.''',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _launchUrl,
              // () {
              //   // _createChat();
              //   // _launchInBrowser(launchUri);
              //   launchUrl(launchUri);
              // },
              icon: const FaIcon(FontAwesomeIcons.whatsapp),
              label: const Text("Chat on Whatsapp"),
            )
          ],
        ),
      ),
    );
  }
}


Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}