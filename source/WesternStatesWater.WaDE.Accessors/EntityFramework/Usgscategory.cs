﻿using System;
using System.Collections.Generic;

namespace WesternStatesWater.WaDE.Accessors.EntityFramework
{
    public partial class Usgscategory
    {
        public Usgscategory()
        {
            BeneficialUsesDim = new HashSet<BeneficialUsesDim>();
        }

        public string Name { get; set; }
        public string Term { get; set; }
        public string Definition { get; set; }
        public string Category { get; set; }
        public string SourceVocabularyUri { get; set; }

        public virtual ICollection<BeneficialUsesDim> BeneficialUsesDim { get; set; }
    }
}
