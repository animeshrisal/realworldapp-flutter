import 'package:flutter/material.dart';
import 'package:realworldapp/blocs/network/network_bloc.dart';
import 'package:realworldapp/blocs/network/network_event.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  NetworkBloc networkBloc;

  @override
  void initState() {
    super.initState();
    networkBloc = NetworkBloc();
    networkBloc.emitEvent(
        NetworkEvent(event: NetworkEventType.requestGet, url: '/articles'));
  }

  @override
  Widget build(BuildContext context) {
    return Text("Articles");
  }
}
