/*
class Response<T> {
  final List<T> results;
  final String error;
  final T responseObject;

  Response(this.results, this.error);

  Response.fromJson(Map<String, dynamic> json)
      : results =
            (json["results"] as List).map((i) => new response.fromJson(i)).toList(),
        error = "";

  Response.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
*/
