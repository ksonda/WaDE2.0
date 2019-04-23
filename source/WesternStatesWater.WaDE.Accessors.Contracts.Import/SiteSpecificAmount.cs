﻿using GeoAPI.Geometries;
using System;

namespace WesternStatesWater.WaDE.Accessors.Contracts.Import
{
    public class SiteSpecificAmount
    {
        public string OrganizationUUID { get; set; }
        public string SiteUUID { get; set; }
        public string VariableSpecificUUID { get; set; }
        public string WaterSourceUUID { get; set; }
        public string MethodUUID { get; set; }
        public DateTime? TimeframeStart { get; set; }
        public DateTime? TimeframeEnd { get; set; }
        public DateTime? DataPublicationDate { get; set; }
        public string DataPublicationDOI { get; set; }
        public string ReportYearCV { get; set; }
        public double Amount { get; set; }
        public double? PopulationServed { get; set; }
        public double? PowerGeneratedGWh { get; set; }
        public double? IrrigatedAcreage { get; set; }
        public string IrrigationMethodCV { get; set; }
        public string CropTypeCV { get; set; }
        public string CommunityWaterSupplySystem { get; set; }
        public string SDWISIdentifier { get; set; }
        public string AssociatedNativeAllocationIDs { get; set; }
        public IGeometry Geometry { get; set;  }
        public string BeneficialUseCategory { get; set; }
        public string PrimaryUseCategory { get; set; }
    }
}
