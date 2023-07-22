import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/app/standard/helpers/constants.dart';
import '/app/standard/navigation/routes/list_page_route.dart';
import '/app/standard/navigation/routes/routes.dart';

// Call firebase API function with share code and public list id
// and it verifies and then adds to the shared list.
// Once done, return something
// and the page can now also get the list from the provider

Future<String> callAddUserToSharedList(
  String userId,
  String publicListId,
  String shareCode,
) async {
  try {
    final queryParameters = <String, String>{
      'userId': userId,
      'publicListId': publicListId,
      'shareCode': shareCode,
    };
    final uri = Uri.http(
      '127.0.0.1:5001',
      '/listanything-2b9b0/us-central1/addUserToSharedList',
      queryParameters,
    );
    logger.d('uri: $uri');
    final response = await http.get(
      uri,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'plain/text',
        'Accept': '*/*'
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      logger.d('Got data');
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      logger.d('Failed to add user to list');
      throw Exception('Failed to add user to list');
    }
  } catch (e) {
    logger.d(e);
    return '$e';
  }
}

class ShareCodePage extends StatefulWidget {
  const ShareCodePage({
    required this.publicListId,
    required this.shareCode,
    required this.userId,
    super.key,
  });

  final String userId;
  final String publicListId;
  final String shareCode;

  @override
  State<ShareCodePage> createState() => _ShareCodePageState();
}

class _ShareCodePageState extends State<ShareCodePage> {
  late Future<String> response;

  @override
  void initState() {
    super.initState();
    response = callAddUserToSharedList(
      widget.userId,
      widget.publicListId,
      widget.shareCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text('Added to shared list');
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Text('Loading');
          },
        ),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!),
                  ElevatedButton(
                    onPressed: () {
                      ListsPageRoute().go(context);
                    },
                    child: const Text('Back to lists'),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
