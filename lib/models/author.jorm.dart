// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _AuthorBean implements Bean<Author> {
  final id = IntField('id');
  final username = StrField('username');
  final image = StrField('image');
  final bio = StrField('bio');
  final postId = IntField('post_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        username.name: username,
        image.name: image,
        bio.name: bio,
        postId.name: postId,
      };
  Author fromMap(Map map) {
    Author model = Author(
      id: adapter.parseValue(map['id']),
      username: adapter.parseValue(map['username']),
      image: adapter.parseValue(map['image']),
      bio: adapter.parseValue(map['bio']),
    );
    model.postId = adapter.parseValue(map['post_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Author model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(username.set(model.username));
      ret.add(image.set(model.image));
      ret.add(bio.set(model.bio));
      ret.add(postId.set(model.postId));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(username.name)) ret.add(username.set(model.username));
      if (only.contains(image.name)) ret.add(image.set(model.image));
      if (only.contains(bio.name)) ret.add(bio.set(model.bio));
      if (only.contains(postId.name)) ret.add(postId.set(model.postId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.username != null) {
        ret.add(username.set(model.username));
      }
      if (model.image != null) {
        ret.add(image.set(model.image));
      }
      if (model.bio != null) {
        ret.add(bio.set(model.bio));
      }
      if (model.postId != null) {
        ret.add(postId.set(model.postId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(username.name, isNullable: false);
    st.addStr(image.name, isNullable: false);
    st.addStr(bio.name, isNullable: false);
    st.addInt(postId.name,
        foreignTable: articleBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Author model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Author newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<Author> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Author model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Author newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<Author> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Author model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Author> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Author> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Author> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Author> findByArticle(int postId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.postId.eq(postId));
    return findOne(find);
  }

  Future<List<Author>> findByArticleList(List<Article> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Article model in models) {
      find.or(this.postId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByArticle(int postId) async {
    final Remove rm = remover.where(this.postId.eq(postId));
    return await adapter.remove(rm);
  }

  void associateArticle(Author child, Article parent) {
    child.postId = parent.id;
  }

  ArticleBean get articleBean;
}
