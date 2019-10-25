using System;
using System.Collections.Generic;

namespace WesternStatesWater.WaDE.Accessors.EntityFramework
{
    public partial class SitesBridgeAllocationFact
    {
        public long SiteBridgeId { get; set; }
        public long SiteId { get; set; }
        public long AllocationAmountId { get; set; }

        public virtual AllocationAmountsFact AllocationAmount { get; set; }
        public virtual SitesDim Site { get; set;}
    }
}