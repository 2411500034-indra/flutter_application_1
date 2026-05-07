import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String namaAktivitas;

  const DetailPage({super.key, required this.namaAktivitas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Detail'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline, size: 60, color: Colors.deepPurpleAccent),
                  SizedBox(height: 20),
                  
                  Text(
                    "Nama Aktivitas:",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  
                  SizedBox(height: 10),
                  
                  Text(
                    namaAktivitas,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 40),
                  
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.deepPurpleAccent),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back Ke Dashboard"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}