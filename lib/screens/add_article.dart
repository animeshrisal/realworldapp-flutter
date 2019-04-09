import 'package:flutter/material.dart';
import 'package:realworldapp/blocs/article/article_form_bloc.dart';
import 'package:realworldapp/blocs/authentication/authentication_bloc.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';
import 'package:realworldapp/blocs/network/network_bloc.dart';
import 'package:realworldapp/blocs/network/network_event.dart';
import 'package:realworldapp/models/post_article_request.dart';

class AddArticle extends StatefulWidget {
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  TextEditingController _titleController;
  TextEditingController _bodyController;
  TextEditingController _descriptionController;
  AuthenticationBloc _authenticationBloc;
  ArticleFormBloc _articleFormBloc;
  NetworkBloc<PostArticleRequest> _networkBloc;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _descriptionController = TextEditingController();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _articleFormBloc = ArticleFormBloc();
    _networkBloc = NetworkBloc<PostArticleRequest>(
        authenticationBloc: _authenticationBloc);
  }

  @override
  void dispose() {
    _articleFormBloc?.dispose();
    _titleController?.dispose();
    _bodyController?.dispose();
    _descriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          StreamBuilder<String>(
              stream: _articleFormBloc.title,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    errorText: snapshot.error,
                  ),
                  controller: _titleController,
                  onChanged: _articleFormBloc.changeTitle,
                  keyboardType: TextInputType.emailAddress,
                );
              }),
          StreamBuilder<String>(
              stream: _articleFormBloc.description,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    errorText: snapshot.error,
                  ),
                  controller: _descriptionController,
                  obscureText: false,
                  onChanged: _articleFormBloc.changeDescription,
                );
              }),
          StreamBuilder<String>(
              stream: _articleFormBloc.body,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'Body',
                    errorText: snapshot.error,
                  ),
                  controller: _bodyController,
                  obscureText: false,
                  onChanged: _articleFormBloc.changeBody,
                );
              }),
          StreamBuilder<bool>(
              stream: _articleFormBloc.submitValid,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return RaisedButton(
                  child: Text('Submit'),
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          _networkBloc.emitEvent(
                              NetworkEvent<PostArticleRequest>(
                                  event: NetworkEventType.request,
                                  modelName: 'article',
                                  model: PostArticleRequest(
                                      title: _titleController.text,
                                      body: _bodyController.text,
                                      description:
                                          _descriptionController.text)));
                        }
                      : null,
                );
              }),
        ],
      ),
    );
  }
}
