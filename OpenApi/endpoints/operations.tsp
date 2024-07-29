import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";
import "../error.tsp";


using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

namespace ResourceOperations {
  op GetAll<T>(): {
    @statusCode statusCode: 200;
    @body items: T[];
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
  op GetById<T>(@path id: string): {
    @statusCode statusCode: 200;
    @body items: T;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
  @post
  op Create<T,U>(@body club: T): {
    @statusCode statusCode: 201;
    @body club: U;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
  @put
  op Update<T,U>(@path id: string,@body pet: T): {
    @statusCode statusCode: 201;
    @body pet: U;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
  @delete
  op Delete(@path id: string): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
}
