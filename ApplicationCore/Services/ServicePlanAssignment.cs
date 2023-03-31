﻿using Infrastructure.Models;
using Infrastructure.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationCore.Services
{
    public class ServicePlanAssignment : IServicePlanAssignment
    {
        IRepositoryPlanAssignment repository = new RepositoryPlanAssignment();
        public PlanAssignment GetPlanAssignmentByID(int id)
        {
            return repository.GetPlanAssignmentByID(id);
        }

        public IEnumerable<PlanAssignment> GetPlanAssignments()
        {
            return repository.GetPlanAssignments();
        }

        public PlanAssignment Save(PlanAssignment planAssignment)
        {
            return repository.Save(planAssignment);
        }
        public PlanAssignment GetPlanAssignmentByMonthAndYear(int month, int year, int IdResidence)
        {
            return repository.GetPlanAssignmentByMonthAndYear(month, year, IdResidence);
        }
    }
}
