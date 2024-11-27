import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  factory Item.fromDocument(DocumentSnapshot doc) {
    return Item(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
    );
  }
}

class CrudScreen extends StatefulWidget {
  @override
  _CrudScreenState createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // CRUD Methods
  Future<void> createItem(String name, String description) async {
    await _firestore.collection('items').add({
      'name': name,
      'description': description,
    });
  }

  Stream<List<Item>> readItems() {
    return _firestore.collection('items').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Item.fromDocument(doc)).toList();
    });
  }

  Future<void> updateItem(String id, String name, String description) async {
    await _firestore.collection('items').doc(id).update({
      'name': name,
      'description': description,
    });
  }

  Future<void> deleteItem(String id) async {
    await _firestore.collection('items').doc(id).delete();
  }

  void showItemDialog({Item? item}) {
    if (item != null) {
      _nameController.text = item.name;
      _descriptionController.text = item.description;
    } else {
      _nameController.clear();
      _descriptionController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? 'Create New Item' : 'Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (item == null) {
                  // Create new item
                  createItem(
                    _nameController.text,
                    _descriptionController.text,
                  ).then((_) {
                    _nameController.clear();
                    _descriptionController.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  });
                } else {
                  // Update existing item
                  updateItem(
                    item.id,
                    _nameController.text,
                    _descriptionController.text,
                  ).then((_) {
                    _nameController.clear();
                    _descriptionController.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Text(item == null ? 'Create' : 'Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Operations')),
      body: StreamBuilder<List<Item>>(
        stream: readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data;

          return ListView.builder(
            itemCount: items!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].name),
                subtitle: Text(items[index].description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showItemDialog(
                            item: items[index]); // Pass the item to update
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteItem(items[index].id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showItemDialog(); // Show dialog to create a new item
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
