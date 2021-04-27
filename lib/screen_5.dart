import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
// import './main.dart';
import 'package:flutter/services.dart'
show rootBundle;

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fifth Screen"),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var mydata = json.decode(snapshot.data.toString());
          print(mydata);
          return ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: mydata == null ? 0 : mydata.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = mydata[index];
              // return ListTile(
              //   title: Text(
              //     item['Device'],
              //     style: Theme.of(context).textTheme.headline5,
              //   ),
              //   subtitle: Text(item['Server']),
              // );
              return CustomListItem(
                type: item['Type'],
                device: item['Device'],
                server: Text(item['Server']),
                channel: item['Channel Number'],
                port: item['Port'],
                status: item['Status'],
                time: item['Time'],
                value: item['Value'],
              );
            },
          );
        })
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key ? key,
    required this.type,
    required this.server,
    required this.device,
    required this.port,
    required this.channel,
    required this.value,
    required this.time,
    required this.status,
  }): super(key: key);

  final String type;
  final Widget server;
  final String device;
  final String port;
  final String channel;
  final String value;
  final String time;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: < Widget > [
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     type,
            //     style: const TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 14.0,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 4,
              child: _CellDescription(
                server: server,
                port: port,
                channel: channel,
                value: value,
                time: time,
                status: status,
                device: device,
                type: type,
              ),
            ),
            // const Icon(
            //   Icons.more_vert,
            //   size: 16.0,
            // ),
          ],
        ),
    );
  }
}

class _CellDescription extends StatelessWidget {
  const _CellDescription({
    Key ? key,
    required this.type,
    required this.server,
    required this.device,
    required this.port,
    required this.channel,
    required this.value,
    required this.time,
    required this.status,
  }): super(key: key);


  final String type;
  final Widget server;
  final String device;
  final String port;
  final String channel;
  final String value;
  final String time;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: < Widget > [
            Text(
              'Type: ' + type,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            if(status == "Active") 
              Text(
                'Status: ' + status,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.green
                ),
              ),
            if(status == "Resolved")
                          Text(
                'Status: ' + status,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.orange
                ),
              ),
            Text(
              'Channel: ' + channel,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
              Text(
                'Device: ' + device,
                style: const TextStyle(fontSize: 10.0),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                Text(
                  'Port: ' + port,
                  style: const TextStyle(fontSize: 10.0),
                ),
                Text(
                  'Value: ' + value,
                  style: const TextStyle(fontSize: 10.0),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                  Text(
                    'Time: ' + time,
                    style: const TextStyle(fontSize: 10.0),
                  ),
            // Row(
            //   children: < Widget > [
            //     Text(
            //       type,
            //       style: const TextStyle(
            //         fontWeight: FontWeight.w500,
            //         fontSize: 14.0,
            //       ),
            //     ),
            //     Text(
            //       status,
            //       style: const TextStyle(
            //         fontWeight: FontWeight.w500,
            //         fontSize: 14.0,
            //       ),
            //     ),
            //     Text(
            //       channel,
            //       style: const TextStyle(
            //         fontWeight: FontWeight.w500,
            //         fontSize: 10.0,
            //       ),
            //     ),
            //   ]
            // ),
            // Row(
            //   children: < Widget > [
            //     const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            //       Text(
            //         device,
            //         style: const TextStyle(fontSize: 10.0),
            //       ),
            //       const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            //         Text(
            //           port,
            //           style: const TextStyle(fontSize: 10.0),
            //         ),
            //   ]
            // ),
            // const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            //   Text(
            //     value,
            //     style: const TextStyle(fontSize: 10.0),
            //   ),
            //   const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            //     Text(
            //       time,
            //       style: const TextStyle(fontSize: 10.0),
            //     ),
          ],
        ),
    );
  }
}