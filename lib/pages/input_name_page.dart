import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputNamePage extends StatefulWidget {
  const InputNamePage({super.key});

  @override
  State<InputNamePage> createState() => _InputNamePageState();
}

class _InputNamePageState extends State<InputNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Isi pake nama kamu ya',
                labelText: 'Nama kamu',
                icon: const FaIcon(FontAwesomeIcons.user),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
