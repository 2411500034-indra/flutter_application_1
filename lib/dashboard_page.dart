import 'package:flutter/material.dart';
import 'detail_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> aktivitas = [
    'kuliah',
    'Olahraga',
    'Membaca',
    'Mengerjakan Tugas',
    'Main Game',
  ];

  final TextEditingController tambahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final Map? args = ModalRoute.of(context)?.settings.arguments as Map?;
    final String namaUser = args?['username'] ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: isLandscape ? screenWidth * 0.7 : screenWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Hello, $namaUser',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Daftar Aktivitas Hari Ini",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: aktivitas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent[50],
                          child: Icon(Icons.assignment, color: Colors.deepPurpleAccent),
                        ),
                        title: Text(
                          aktivitas[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(namaAktivitas: aktivitas[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tampilkanDialogTambah,
        child: Icon(Icons.add),
      ),
    );
  }

  void tampilkanDialogTambah() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Tambah Aktivitas'),
          content: TextField(
            controller: tambahController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Nama aktivitas baru...",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                tambahController.clear();
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (tambahController.text.isNotEmpty) {
                  setState(() {
                    aktivitas.add(tambahController.text);
                  });
                  tambahController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}
