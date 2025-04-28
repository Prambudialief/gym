import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/system_crud.dart';

class crudGym extends StatefulWidget {
  const crudGym({super.key});

  @override
  State<crudGym> createState() => _crudGymState();
}

class _crudGymState extends State<crudGym> {
  final CollectionReference gymNotes =
  FirebaseFirestore .instance.collection('gym_notes');

  void hapusData(String docId) {
    gymNotes.doc(docId).delete();
  }

  void updateData(BuildContext context, String docId, String variasi, String hari) {
    final TextEditingController variasiController = TextEditingController(text: variasi);
    final TextEditingController hariController = TextEditingController(text: hari);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: variasiController,
              decoration: InputDecoration(labelText: 'Variasi Otot'),
            ),
            TextField(
              controller: hariController,
              decoration: InputDecoration(labelText: 'Hari apa'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              gymNotes.doc(docId).update({
                'variasi': variasiController.text,
                'hari': hariController.text,
              });
              Navigator.pop(context);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SistemCrud()));
        },
        child: Icon(Icons.add),
      ),
       body: StreamBuilder<QuerySnapshot>(
        stream: gymNotes.orderBy('created_at', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return Card(
                  child: ListTile(
                    title: Text(item['variasi']),
                    subtitle: Text('Hari: ${item['hari']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => updateData(context, item.id, item['variasi'], item['hari']),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => hapusData(item.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}