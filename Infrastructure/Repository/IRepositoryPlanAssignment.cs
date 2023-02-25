﻿using Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repository
{
    public interface IRepositoryPlanAssignment
    {
        IEnumerable<PlanAssignment> GetPlanAssignments();
        PlanAssignment GetPlanAssignmentByID(int id);
    }
}
