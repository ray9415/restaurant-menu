using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace restaurant.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        [DisplayName("商品名稱")]
        [Required(ErrorMessage ="品名不可為空")]
        public string Name { get; set; }

        [DisplayName("類型")]
        public string Type { get; set; }

        [DisplayName("描述")]
        public string Description { get; set; }

        [DisplayName("單價")]
        public int Price { get; set; }

        [DisplayName("圖片")]
        public string IMG { get; set; }

    }
}
