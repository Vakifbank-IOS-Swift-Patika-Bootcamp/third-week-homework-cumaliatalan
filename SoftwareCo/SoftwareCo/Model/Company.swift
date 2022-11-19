//
//  Company.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 18.11.2022.
//

import Foundation

var employee : [EmployeeModel] = []

class Company {
    let companyName: String = "Atalan Group"
    let foundationYear: Int = 1997
    var budget: Double = 1000000.0
    var employeeList: [EmployeeModel] = []
    
    
    func addBudget(quantity : Double) -> Double {
        budget += quantity
        return budget
    }
    
    func addExpense(expense : Double) -> Double {
        budget -= expense
        return budget
    }
    
    func addEmployee(emp : EmployeeModel) -> [EmployeeModel] {
        for  employee in [emp] {
            employeeList.append(employee)
        }
        return employeeList
    }
    
}
