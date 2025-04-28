import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SistemCrud extends StatefulWidget {
  const SistemCrud({super.key});

  @override
  State<SistemCrud> createState() => _SistemCrudState();
}

class _SistemCrudState extends State<SistemCrud> {
  final TextEditingController variasiController = TextEditingController();
  final TextEditingController hariController = TextEditingController();
  
  final CollectionReference gymNotes =
      FirebaseFirestore.instance.collection('gym_notes');

  void tambahData() async {
    String variasi = variasiController.text.trim();
    String hari = hariController.text.trim();

    if (variasi.isNotEmpty && hari.isNotEmpty) {
      await gymNotes.add({
        'variasi': variasi,
        'hari': hari,
        'created_at': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil ditambahkan')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: 20,
          ),
          ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Variasi Otot',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: variasiController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Text(
              'Hari apa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: hariController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: tambahData, 
              child: 
              Text(
                'simpan',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
