import 'package:flutter/material.dart';

class ContactApp extends StatefulWidget {
    const ContactApp({super.key});
    @override
    State<StatefulWidget> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
    //Optimise the list format
    Map<double, String> contacts = {};

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Contacts'),
            ),
            body: ListView.builder(
                itemCount: 1,        itemBuilder: (context, index) {
                  return makeContactTile(8591224915, 'Kshitij');
                },
            ),
        );
    }

    Widget makeContactTile(contactNumber, contactName) {
        return Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                    width: 0,
                ),
                borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
                leading: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(25),
                    ),
                    child: (Icon(
                        Icons.person,
                        size: 40,
                    )),
                ),
                title: Text(contactName),
                subtitle: Text(contactNumber.toString()),
                trailing: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.call),
                ),
            ),
        );
    }
}
