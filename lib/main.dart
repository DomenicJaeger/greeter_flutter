import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? gender;
  String? lastName;
  String? firstName;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Texteingabe Vorname
            TextFormField(
              maxLength: 24,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-ZäÄöÖüÜß\\-\\. ]")),
              ],
              keyboardType: TextInputType.text,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Vorname',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onChanged: (String value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            //Texteingabe Nachname
            TextFormField(
              maxLength: 24,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-ZäÄöÖüÜß\\-\\. ]")),
              ],
              keyboardType: TextInputType.text,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Nachname',
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green)),
              ),
              textInputAction: TextInputAction.next,
              onChanged: (String value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            const SizedBox(height: 20),

            //Checkbox zur Abfrage der Volljährigkeit
            CheckboxListTile(
              title: const Text("Volljährig?"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
              activeColor: Colors.deepPurple,
              checkColor: Colors.white,
            ),
            const SizedBox(height: 20),

            //Drei Radio Buttons zur Auswahl des Geschlechts
            RadioListTile(
              title: const Text("Männlich"),
              value: "männlich",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Weiblich"),
              value: "weiblich",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Divers"),
              value: "divers",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            const SizedBox(height: 20),

            //Ausgabe der Begrüßung
            Text(
              firstName == null ||
                      lastName == null ||
                      firstName == "" ||
                      lastName == ""
                  ? 'Bitte Daten eingeben'
                  : isChecked == true
                      ? (gender == 'männlich'
                          ? 'Hallo Herr $lastName'
                          : gender == 'weiblich'
                              ? 'Hallo Frau $lastName'
                              : 'Hallo $firstName $lastName')
                      : 'Hallo $firstName',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

//Extension lässt erstes Zeichen im String groß- alle folgenden kleingeschrieben erscheinen
/*extension MyExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}*/
