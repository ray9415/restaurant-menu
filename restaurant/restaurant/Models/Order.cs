using Microsoft.AspNetCore.Diagnostics;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace restaurant.Models
{
    public class Order
    {
        public int Id { get; set; }

        public DateTime DateTime { get; set; } = DateTime.Now;

        public int Table { get; set; }

        [Required(ErrorMessage ="必填欄位")]
        [DisplayName("姓名")]
        public string Name { get; set; }

        [Required(ErrorMessage = "必填欄位")]
        [DisplayName("連絡電話")]
        public string PhoneNo { get; set; }

        [DisplayName("備註")]
        public string statement { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }
    }
}
