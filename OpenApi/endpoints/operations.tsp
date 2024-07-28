import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";
import "../error.tsp";


using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

interface ResourceOperations<T,U> {
  op GetAll(): {
    @statusCode statusCode: 200;
    @body items: T[];
  } | {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
  op GetById(@path id: string): {
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
  op Create(@body club: T): {
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
  op Update(@body pet: T): {
    @statusCode statusCode: 201;
    @body pet: U;
  } | {
    @statusCode statusCode: 400;
    @body error: ValidationError;
  } | {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
  };
}
