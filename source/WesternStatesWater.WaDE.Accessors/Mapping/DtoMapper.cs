﻿using AutoMapper;

namespace WesternStatesWater.WaDE.Accessors.Mapping
{
    internal static class DtoMapper
    {
        static IMapper _mapper;
        private static IConfigurationProvider _config;

        static IMapper Mapper => _mapper ?? (_mapper = Configuration.CreateMapper());

        public static IConfigurationProvider Configuration
        {
            get
            {
                if (_config == null)
                {
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.AddProfile<ApiProfile>();
                    });
                    _config = config;
                }
                return _config;
            }
        }

        public static T Map<T>(this object source)
        {
            return Mapper.Map<T>(source);
        }

        public static void Map(this object source, object dest)
        {
            Mapper.Map(source, dest);
        }
    }
}
