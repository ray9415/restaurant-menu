using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace restaurant.Models
{
    public class OrderDetail
    {

        public int Id { get; set; }

        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }

        [ForeignKey("OrderId")]
        public virtual Order Order { get; set; }

        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
    }
}
