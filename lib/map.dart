import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapShapeSource _mapShapeSource;
  late List<MapModel> _mapData;

  @override
  void initState() {
    _mapData = _getMapDetails();
    _mapShapeSource = MapShapeSource.asset(
      'assets/lk.json',
      shapeDataField: 'name',
      dataCount: _mapData.length,
      primaryValueMapper: (index) => _mapData[index].state,
      shapeColorValueMapper: (index) => _mapData[index].color,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Select a Proince',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: SfMaps(layers: [
            MapShapeLayer(
              source: _mapShapeSource,
              showDataLabels: true,
              strokeColor: const Color.fromARGB(255, 0, 0, 0),
              onSelectionChanged: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          _proviencePage(_mapData[value].state)),
                );
              },
            ),
          ]),
        )
      ]),
    );
  }

  static List<MapModel> _getMapDetails() {
    return <MapModel>[
      MapModel("Trikuṇāmalaya", Colors.black54),
      MapModel("Mulativ", const Color.fromARGB(137, 112, 65, 65)),
      MapModel("Yāpanaya", Color.fromARGB(226, 237, 2, 2)),
      MapModel("Kilinŏchchi", Colors.deepOrange),
      MapModel("Mannārama", Colors.orange),
      MapModel("Puttalama", Colors.deepOrangeAccent),
      MapModel("Gampaha", Colors.blue), // Changed color to blue
      MapModel("Kaḷutara", Colors.green), // Changed color to green
      MapModel("Gālla", Colors.yellow), // Changed color to yellow
      MapModel("Mātara", Colors.purple), // Changed color to purple
      MapModel("Hambantŏṭa", Colors.teal), // Changed color to teal
      MapModel("Ampāra", Colors.red), // Changed color to red
      MapModel("Maḍakalapuva", Colors.indigo), // Changed color to indigo
      MapModel("Ratnapura", Colors.cyan), // Changed color to cyan
      MapModel("Mŏṇarāgala", Colors.pink), // Changed color to pink
      MapModel("Kægalla", Colors.amber), // Changed color to amber
      MapModel("Badulla", Colors.lime), // Changed color to lime
      MapModel("Mātale", Colors.brown), // Changed color to brown
      MapModel("Pŏḷŏnnaruva", Colors.grey), // Changed color to grey
      MapModel("Kuruṇægala", Colors.deepPurple), // Changed color to deep purple
      MapModel(
          "Anurādhapura", Colors.deepOrange), // Changed color to deep orange
      MapModel(
          "Nuvara Ĕliya", Colors.lightGreen), // Changed color to light green
      MapModel("Vavuniyāva", Colors.lightBlue), // Changed color to light blue
      MapModel(
          "Mahanuvara", Colors.orangeAccent), // Changed color to orange accent
      MapModel("Kŏḷamba", Colors.redAccent), // Changed color to red accent
    ];
  }

  _proviencePage(String value) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            value,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}

class MapModel {
  MapModel(this.state, this.color);
  String state;
  Color color;
}
