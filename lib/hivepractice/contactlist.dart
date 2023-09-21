import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('contactbox');
  runApp(MaterialApp(
    home: Contacthome(),
  ));
}

class Contacthome extends StatefulWidget {
  const Contacthome({super.key});

  @override
  State<Contacthome> createState() => _ContacthomeState();
}

class _ContacthomeState extends State<Contacthome> {
  List<Map<String, dynamic>> contacts = [];
  final namecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final mybox = Hive.box('contactbox');

  @override
  void initState() {
    loadcontacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: contacts.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(contacts[index]['contactname']),
                      subtitle: Text(contacts[index]['contactnumber']),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showContact(context, null),
        label: Text("add contact"),
        icon: Icon(Icons.add),
      ),
    );
  }

  showContact(BuildContext context, int? contactket) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "contact name",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: numbercontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "contact number",
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (namecontroller.text != "" &&
                          numbercontroller.text != "") {
                        if (contactket == null) {
                          createcontact({
                            'name': namecontroller.text.trim(),
                            'content': numbercontroller.text.trim(),
                          });
                        } else {
                          updatecontact(contactket, {
                            'name': namecontroller.text.trim(),
                            'content': numbercontroller.text.trim(),
                          });
                        }
                      }
                      namecontroller.text = "";
                      numbercontroller.text = "";
                      Navigator.pop(context);
                    },
                    child: Text(contactket == null ? "create" : "uodate"))
              ],
            ),
          );
        });
  }

  Future<void> createcontact(Map<String, String> contact) async {
    await mybox.add(contact);
    loadcontacts();
  }

  void updatecontact(int contactket, Map<String, String> map) {}

  void loadcontacts() {
    final task_from_hive = mybox.keys.map((key) {
      final value = mybox.get(key);

      return {
        'id': key,
        'contactname': value['name'],
        'contactnumber': value['content'],
      };
    }).toList();
    setState(() {
      contacts = task_from_hive.reversed.toList();
    });
  }
}
