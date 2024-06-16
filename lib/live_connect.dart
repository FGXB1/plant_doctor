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
  final _notesController = TextEditingController();
  
  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Live Connect'),
        backgroundColor: kColorScheme.primary,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xffbbf76e), Color(0xff0b6809)],
              stops: [0.07, 1],
              center: Alignment.bottomCenter,
              radius: 2.0,
              focal: Alignment.bottomCenter,
              focalRadius: 0.1
            ),
          ), 
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    ''' Need Expert’s Advice? 
You chose the right lifeline!''',
                    style: TextStyle(
                      fontSize: 24,
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
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    label: const Text("Chat on Whatsapp"),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _notesController,
                      maxLines: 5,
                      // scrollController: ScrollController(),
                      decoration: InputDecoration(
                        hintText: _notesController.text,
                        border: const OutlineInputBorder(),
                        label: const Text('Make notes of your queries and prescription received here:')
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("FAQ:-",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,),
                      ),
                  
                  const FAQ(question:'Question Number 1', answer: 'Answer Number 1'),
                  const FAQ(question:'Question Number 2', answer: 'Answer Number 2'),
                  const FAQ(question:'Question Number 3', answer: 'Answer Number 3'),
                ],
              ),
            ),
          ),
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({super.key, required this.question, required this.answer});
  final String question;
  final String answer;
  

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: <Widget>[
        ListTile(title: Text(answer)),
      ],
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
