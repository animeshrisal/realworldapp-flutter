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
  final authorId = IntField('author_id');
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
        authorId.name: authorId,
      };
  Article fromMap(Map map) {
    Article model = Article(
      title: adapter.parseValue(map['title']),
      updatedAt: adapter.parseValue(map['updated_at']),
      slug: adapter.parseValue(map['slug']),
      favoriteCount: adapter.parseValue(map['favorite_count']),
      favorited: adapter.parseValue(map['favorited']),
      description: adapter.parseValue(map['description']),
      createdAt: adapter.parseValue(map['created_at']),
      body: adapter.parseValue(map['body']),
    );
    model.id = adapter.parseValue(map['id']);
    model.authorId = adapter.parseValue(map['author_id']);

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
      ret.add(authorId.set(model.authorId));
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
      if (only.contains(authorId.name)) ret.add(authorId.set(model.authorId));
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
      if (model.authorId != null) {
        ret.add(authorId.set(model.authorId));
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
    st.addInt(favoriteCount.name, isNullable: true);
    st.addBool(favorited.name, isNullable: false);
    st.addStr(description.name, isNullable: false);
    st.addDateTime(createdAt.name, isNullable: false);
    st.addStr(body.name, isNullable: false);
    st.addInt(authorId.name,
        foreignTable: authorBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Article model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Article> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Article model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Article> models,
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

  Future<int> update(Article model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Article> models,
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

  Future<Article> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
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

  Future<List<Article>> findByAuthor(int authorId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.authorId.eq(authorId));
    return findMany(find);
  }

  Future<List<Article>> findByAuthorList(List<Author> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Author model in models) {
      find.or(this.authorId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByAuthor(int authorId) async {
    final Remove rm = remover.where(this.authorId.eq(authorId));
    return await adapter.remove(rm);
  }

  void associateAuthor(Article child, Author parent) {
    child.authorId = parent.id;
  }

  AuthorBean get authorBean;
}
