//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace petshop.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Adress
    {
        public int Id { get; set; }
        public Nullable<int> IdIndex { get; set; }
        public Nullable<int> IdCity { get; set; }
        public Nullable<int> IdStreet { get; set; }
        public Nullable<int> IdPickPoint { get; set; }
    
        public virtual City City { get; set; }
        public virtual Index Index { get; set; }
        public virtual PickPoint PickPoint { get; set; }
        public virtual Street Street { get; set; }
    }
}