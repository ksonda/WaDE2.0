﻿using System;

namespace WesternStatesWater.WaDE.Accessors.Contracts.Api
{
    public class SiteVariableAmountsFilters
    {
        public string SiteTypeCv { get; set; }
        public string VariableCv { get; set; }
        public string VariableSpecificCv { get; set; }
        public string BeneficialUseCv { get; set; }
        public string UsgsCategoryNameCv { get; set; }
        public string Geometry { get; set; }
        public DateTime? TimeframeStartDate { get; set; }
        public DateTime? TimeframeEndDate { get; set; }
        public string SiteUuid { get; set; }
    }
}