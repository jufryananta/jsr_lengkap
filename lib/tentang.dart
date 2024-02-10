import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Html(
            data: '''
              <h3 style="text-align: center;">Jurus Sehat Rasulullah (JSR)</h3>
              <h5 style="text-align: center;"><strong>Versi 1.0</strong></h5>
              <p style="text-align: center;"><strong>credit:</strong></p>
              <p style="text-align: center;">@zaidulakbar</p>
              <p style="text-align: center;">@nanacuisine_</p>
              <p style="text-align: center;">@sulistyowati_05</p>
              '''
          )
        )
      )
    );
  }
}