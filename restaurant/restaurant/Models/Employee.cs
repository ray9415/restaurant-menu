using Microsoft.AspNetCore.Diagnostics;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace restaurant.Models
{
    public class Employee
    {
        [Key] public int Id { get; set; }

        public string Name { get; set; }

        public string Type { get; set; }
    }
}
