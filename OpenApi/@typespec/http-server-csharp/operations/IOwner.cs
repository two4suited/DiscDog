// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// <auto-generated />

using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DiscDog.Service.Models;

namespace DiscDog.Service
{

    public interface IOwner
    {
        ///<summary>
        /// Gets an instance of the resource.
        ///</summary>
        Task<Owner> GetAsync(string id);
        ///<summary>
        /// Updates an existing instance of the resource.
        ///</summary>
        Task<Owner> UpdateAsync(string id, OwnerUpdate properties);
        ///<summary>
        /// Deletes an existing instance of the resource.
        ///</summary>
        Task DeleteAsync(string id);
        ///<summary>
        /// Creates a new instance of the resource.
        ///</summary>
        Task<Owner> CreateAsync(OwnerCreate resource);
        ///<summary>
        /// Lists all instances of the resource.
        ///</summary>
        Task<OwnerCollectionWithNextLink> ListAsync();

    }
}
