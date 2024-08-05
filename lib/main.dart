import 'package:authentication_authorization/login.dart';
import 'package:authentication_authorization/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://houwgpngbcwhakmvjghm.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvdXdncG5nYmN3aGFrbXZqZ2htIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE1NTE2MjUsImV4cCI6MjAzNzEyNzYyNX0.hIi0aV-M-KglM876ofNA5dveZheYTA7xaGFCqihvqeo");

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignUp());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Loginpage()));
  } //Sign Out user

  final noteStream = supabase.from('Notes').stream(primaryKey: ['id']);

  Future<void> createNote(String note) async {
    await supabase.from('Notes').insert({'body': note});
  } //Create Note

  Future<void> updateNotes(String noteId, String updatedNotes) async {
    await supabase
        .from('Notes')
        .update({'body': updatedNotes}).eq('id', noteId);
  }

  Future<void> deleteNote(String noteId) async {
    await supabase.from('Notes').delete().eq('id', noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout_outlined),
          ),
          ElevatedButton(
            iconAlignment: IconAlignment.start,
            child: Icon(Icons.home),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 5,
            ),
          ),
          ElevatedButton(
            iconAlignment: IconAlignment.start,
            child: Icon(Icons.search),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 5,
            ),
          ),
          ElevatedButton(
            iconAlignment: IconAlignment.start,
            child: Icon(Icons.notification_add),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(title: const Text('Add Note'), children: [
                  TextFormField(
                    onFieldSubmitted: (value) {
                      createNote(value);
                      if (mounted) Navigator.pop(context);
                    },
                  )
                ]);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: noteStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Notes = snapshot.data!;

          return ListView.builder(
              itemCount: Notes.length,
              itemBuilder: (context, index) {
                final note = Notes[index];
                final noteId = note['id'].toString();

                return ListTile(
                  title: Text(note['body']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                    title: const Text('Edit a Note'),
                                    children: [
                                      TextFormField(
                                        initialValue: note['body'],
                                        onFieldSubmitted: (value) async {
                                          await updateNotes(noteId, value);
                                          if (mounted) Navigator.pop(context);
                                        },
                                      )
                                    ]);
                              });
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          bool deletedConfirmed = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete a Note'),
                                  content: const Text(
                                      'Are you sure you want to delete this note?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              });
                          if (deletedConfirmed) {
                            await deleteNote(noteId);
                          }
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
