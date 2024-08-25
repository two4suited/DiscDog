// File: owner.tsp
import "@typespec/rest";
import "./error.tsp";

using TypeSpec.Rest;

model Owner {
    @segment("owner")
    @key
    id: string;
    name: string;
    email: string;  
    @visibility("create","read")
    created_by: string;
    @visibility("read")
    created_when: plainDate;
    @visibility("update","read")
    update_by: string;
    @visibility("read")
    updated_when: plainDate;
  }
  
  
