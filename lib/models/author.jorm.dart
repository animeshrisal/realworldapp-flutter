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
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        username.name: username,
        image.name: image,
        bio.name: bio,
      };
  Author fromMap(Map map) {
    Author model = Author(
      username: adapter.parseValue(map['username']),
      image: adapter.parseValue(map['image']),
      bio: adapter.parseValue(map['bio']),
    );
    model.id = adapter.parseValue(map['id']);

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
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(username.name)) ret.add(username.set(model.username));
      if (only.contains(image.name)) ret.add(image.set(model.image));
      if (only.contains(bio.name)) ret.add(bio.set(model.bio));
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
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(username.name, isNullable: false);
    st.addStr(image.name, isNullable: true);
    st.addStr(bio.name, isNullable: true);
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
      if (model.articles != null) {
        newModel ??= await find(retId);
        model.articles.forEach((x) => articleBean.associateAuthor(x, newModel));
        for (final child in model.articles) {
          await articleBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Author> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
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
      if (model.articles != null) {
        newModel ??= await find(retId);
        model.articles.forEach((x) => articleBean.associateAuthor(x, newModel));
        for (final child in model.articles) {
          await articleBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Author> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(Author model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Author newModel;
      if (model.articles != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.articles
              .forEach((x) => articleBean.associateAuthor(x, newModel));
        }
        for (final child in model.articles) {
          await articleBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Author> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<Author> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Author model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final Author newModel = await find(id);
      if (newModel != null) {
        await articleBean.removeByAuthor(newModel.id);
      }
    }
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

  Future<Author> preload(Author model, {bool cascade = false}) async {
    model.articles = await articleBean.findByAuthor(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Author>> preloadAll(List<Author> models,
      {bool cascade = false}) async {
    models.forEach((Author model) => model.articles ??= []);
    await OneToXHelper.preloadAll<Author, Article>(
        models,
        (Author model) => [model.id],
        articleBean.findByAuthorList,
        (Article model) => [model.authorId],
        (Author model, Article child) =>
            model.articles = List.from(model.articles)..add(child),
        cascade: cascade);
    return models;
  }

  ArticleBean get articleBean;
}
