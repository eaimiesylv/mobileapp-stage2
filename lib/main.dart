import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'My Name Is OKom Emmanuel';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fullname.dispose();
    phone.dispose();
    email.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: TextFormField(
              controller: fullname,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'FullName',
              ),
            ),
          ),
          ListTile(
            title: TextFormField(
              controller: phone,
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
            ),
          ),
          ListTile(
            title: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter email Address',
                labelText: 'Enter your email address',
              ),
            ),
          ),
          ListTile(
            title: TextFormField(
              controller: address,
              decoration: const InputDecoration(
                icon: const Icon(Icons.home),
                hintText: 'Address',
                labelText: 'Enter Your Address',
              ),
            ),
          ),
          ListTile(
            title: Container(
              margin: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => onSubmit(context),
                child: Text('Submit'),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Click the image below for more detail'),
                GestureDetector(
                  onTap: () {
                    _launch('https://hng.tech/');
                  },
                  child: Image.asset("images/hng.png", width: 200, height: 50),
                ),
                Text('Click the image below for more detail'),
                GestureDetector(
                  onTap: () {
                    _launch('https://ingressive.org/');
                  },
                  child: Image.asset("images/i4g.png", width: 200, height: 50),
                ),
                Text('Click the image below for more detail'),
                GestureDetector(
                  onTap: () {
                    _launch('https://internship.zuri.team/');
                  },
                  child: Image.asset("images/zuru.png", width: 200, height: 50),
                ),
              ]),
        ],
      ),
    );
  }

  onSubmit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Your Submitted Detail'),
            content: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('Name ' + fullname.text),
                ),
                ListTile(
                  title: Text('Phone Number ' + phone.text),
                ),
                ListTile(
                  title: Text('Email ' + email.text),
                ),
                ListTile(
                  title: Text('Address ' + address.text),
                ),
              ],
            ),
          );
        });
  }

  Future<void> _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
