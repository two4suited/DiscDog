// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// <auto-generated />

using System;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace DiscDog.Service.Models
{

    public partial class Dog
    {
        public string Id { get; set; }

        public string Name { get; set; }

        public string Breed { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedWhen { get; set; }

        public string UpdateBy { get; set; }

        public DateTime UpdatedWhen { get; set; }


    }
}
