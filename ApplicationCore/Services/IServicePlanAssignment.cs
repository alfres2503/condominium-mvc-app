﻿using Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationCore.Services
{
    public interface IServicePlanAssignment
    {
        IEnumerable<PlanAssignment> GetPlanAssignments();
        PlanAssignment GetPlanAssignmentByID(int id);
        PlanAssignment Save(PlanAssignment planAssignment);
        PlanAssignment GetPlanAssignmentByMonthAndYear(int month, int year, int IdResidence);
    }
}
