abstract class CoreResponse<T extends Response<R>, R> {}

abstract class Response <T> {
  T toMap();
}

