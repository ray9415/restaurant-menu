using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace restaurant.Models
{
    public class OrderDetail
    {
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        //[Key]
        public int OrderId { get; set; }

        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        //[Key]
        public int ProductId { get; set; }


        public int Quantity { get; set; }


        public int Price { get; set; }
    }
}
