import "@typespec/http";
import "@typespec/rest";

using TypeSpec.Http;

@error
model Error {
  code: 400 | 500;
  message: string;
}