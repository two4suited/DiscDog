// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// <auto-generated />

using System;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace DiscDog.Service.Models
{

    ///<summary>
    /// Paged response of Dog items
    ///</summary>
    public partial class DogCollectionWithNextLink
    {
        ///<summary>
        /// The items on this page
        ///</summary>
        public Dog[] Value { get; set; }

        ///<summary>
        /// The link to the next page of items
        ///</summary>
        public string NextLink { get; set; }


    }
}
