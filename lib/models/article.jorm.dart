// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ArticleBean implements Bean<Article> {
  final id = IntField('id');
  final title = StrField('title');
  final updatedAt = DateTimeField('updated_at');
  final slug = StrField('slug');
  final favoriteCount = IntField('favorite_count');
  final favorited = BoolField('favorited');
  final description = StrField('description');
  final createdAt = DateTimeField('created_at');
  final body = StrField('body');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        title.name: title,
        updatedAt.name: updatedAt,
        slug.name: slug,
        favoriteCount.name: favoriteCount,
        favorited.name: favorited,
        description.name: description,
        createdAt.name: createdAt,
        body.name: body,
      };
  Article fromMap(Map map) {
    Article model = Article(
      id: adapter.parseValue(map['id']),
      title: adapter.parseValue(map['title']),
      updatedAt: adapter.parseValue(map['updated_at']),
      slug: adapter.parseValue(map['slug']),
      favoriteCount: adapter.parseValue(map['favorite_count']),
      favorited: adapter.parseValue(map['favorited']),
      description: adapter.parseValue(map['description']),
      createdAt: adapter.parseValue(map['created_at']),
      body: adapter.parseValue(map['body']),
    );

    return model;
  }

  List<SetColumn> toSetColumns(Article model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(title.set(model.title));
      ret.add(updatedAt.set(model.updatedAt));
      ret.add(slug.set(model.slug));
      ret.add(favoriteCount.set(model.favoriteCount));
      ret.add(favorited.set(model.favorited));
      ret.add(description.set(model.description));
      ret.add(createdAt.set(model.createdAt));
      ret.add(body.set(model.body));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(updatedAt.name))
        ret.add(updatedAt.set(model.updatedAt));
      if (only.contains(slug.name)) ret.add(slug.set(model.slug));
      if (only.contains(favoriteCount.name))
        ret.add(favoriteCount.set(model.favoriteCount));
      if (only.contains(favorited.name))
        ret.add(favorited.set(model.favorited));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(createdAt.name))
        ret.add(createdAt.set(model.createdAt));
      if (only.contains(body.name)) ret.add(body.set(model.body));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.updatedAt != null) {
        ret.add(updatedAt.set(model.updatedAt));
      }
      if (model.slug != null) {
        ret.add(slug.set(model.slug));
      }
      if (model.favoriteCount != null) {
        ret.add(favoriteCount.set(model.favoriteCount));
      }
      if (model.favorited != null) {
        ret.add(favorited.set(model.favorited));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.createdAt != null) {
        ret.add(createdAt.set(model.createdAt));
      }
      if (model.body != null) {
        ret.add(body.set(model.body));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(title.name, isNullable: false);
    st.addDateTime(updatedAt.name, isNullable: false);
    st.addStr(slug.name, isNullable: false);
    st.addInt(favoriteCount.name, isNullable: false);
    st.addBool(favorited.name, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addDateTime(createdAt.name, isNullable: false);
    st.addStr(body.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Article model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Article newModel;
      if (model.author != null) {
        newModel ??= await find(model.id);
        authorBean.associateArticle(model.author, newModel);
        await authorBean.insert(model.author, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Article> models,
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

  Future<dynamic> upsert(Article model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Article newModel;
      if (model.author != null) {
        newModel ??= await find(model.id);
        authorBean.associateArticle(model.author, newModel);
        await authorBean.upsert(model.author, cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Article> models,
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

  Future<int> update(Article model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Article newModel;
      if (model.author != null) {
        if (associate) {
          newModel ??= await find(model.id);
          authorBean.associateArticle(model.author, newModel);
        }
        await authorBean.update(model.author,
            cascade: cascade, associate: associate);
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Article> models,
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

  Future<Article> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Article model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final Article newModel = await find(id);
      if (newModel != null) {
        await authorBean.removeByArticle(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Article> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Article> preload(Article model, {bool cascade = false}) async {
    model.author = await authorBean.findByArticle(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Article>> preloadAll(List<Article> models,
      {bool cascade = false}) async {
    await OneToXHelper.preloadAll<Article, Author>(
        models,
        (Article model) => [model.id],
        authorBean.findByArticleList,
        (Author model) => [model.postId],
        (Article model, Author child) => model.author = child,
        cascade: cascade);
    return models;
  }

  AuthorBean get authorBean;
}
