import 'package:flutter/material.dart';
import 'package:my_flutter_module/DogBreed.dart';
import 'package:my_flutter_module/service_api.dart';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        var uri = Uri.parse(settings.name!);
        String? route = uri.path;
        Map? queryParameters = uri.queryParameters;

        switch (route) {
          case "/DogBreedDetailScreen":
            return MaterialPageRoute(
              builder: (context) => MyHomePage(
                breedId: queryParameters["id"] ?? "",
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String breedId;

  const MyHomePage({super.key, required this.breedId});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DogBreed? _breed;
  ServiceApi _service = ServiceApi();

  @override
  void initState() {
    super.initState();
    _loadDogBreedData();
  }

  _loadDogBreedData() async {
    try {
      var result = await _service.fetchDogBreed(widget.breedId);
      Map<String, dynamic> breedData = jsonDecode(result.data);
      setState(() {
        _breed = DogBreed.fromJson(breedData);
      });
    } catch (e) {
      print("Error from host app $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createDetailRow(rowData: 'Name: ${_breed?.name ?? ""}'),
            _createDetailRow(
                rowData:
                    'Weight: ${_breed?.weight.metric ?? ""} kg (${_breed?.weight.imperial ?? ""} lbs)'),
            _createDetailRow(
                rowData:
                    'Height: ${_breed?.height.metric ?? ""} cm (${_breed?.height.imperial ?? ""} in)'),
            _createDetailRow(
                rowData: 'Description: ${_breed?.description ?? ""}'),
            _createDetailRow(rowData: 'Bred For: ${_breed?.bred_for ?? ""}'),
            _createDetailRow(
                rowData: 'Breed Group: ${_breed?.breed_group ?? ""}'),
            _createDetailRow(rowData: 'Life Span: ${_breed?.life_span ?? ""}'),
            _createDetailRow(
                rowData: 'Temperament: ${_breed?.temperament ?? ""}'),
          ],
        ),
      ),
    );
  }

  Widget _createDetailRow({required String rowData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        rowData,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
