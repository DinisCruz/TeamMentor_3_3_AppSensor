﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using O2.DotNetWrappers.ExtensionMethods;

namespace TeamMentor.CoreLib
{
    public class TM_UserData
    {
        public static TM_UserData       Current             { get; set; }
        public string 	                Path_UserData 	    { get; set; }	
        public List<TMUser>	            TMUsers			    { get; set; }
        public Dictionary<Guid, TMUser>	ActiveSessions	    { get; set; }
        public bool                     UsingFileStorage    { get; set; }
        
        public TM_UserData() : this (false)
        {
        }

        public TM_UserData(bool useFileStorage)
        {
            Current = this;
            UsingFileStorage = useFileStorage;
            SetUp();
        }

        public TM_UserData SetUp()
        {            
            TMUsers = new List<TMUser>();            
            ActiveSessions = new Dictionary<Guid, TMUser>();
            return this;
        }
    }
}
