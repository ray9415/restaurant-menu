using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace restaurant.Models
{
    public class OrderDetail
    {

        public int OrderId { get; set; }


        public int ProductId { get; set; }


        public int Quantity { get; set; }


        public int Price { get; set; }
    }
}
