// File: owner.tsp
import "@typespec/rest";
import "./error.tsp";

using TypeSpec.Rest;

model Dog {
    @segment("dog")
    @key
    id: string;
    name: string;
    breed: string;
    @visibility("create","read")
    created_by: string;
    @visibility("read")
    created_when: plainDate;
    @visibility("update","read")
    update_by: string;
    @visibility("read")
    updated_when: plainDate;
  }
  
  