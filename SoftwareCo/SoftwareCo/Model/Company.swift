//
//  Company.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 18.11.2022.
//

import Foundation

var employee : [EmployeeModel] = []

class Company {
    // Sirketin degismez verileri doldurulur
    let companyName: String = "Atalan Group"
    let foundationYear: Int = 1997
    
    // degiskenler tanimlanir
    var budget: Double = 1000000.0
    var employeeList: [EmployeeModel] = []
    
    // sirket butcesine ekleme fonksiyonu
    func addBudget(quantity : Double) -> Double {
        budget += quantity
        return budget
    }
    
    // sirket butcesinde gider ekleme
    func addExpense(expense : Double) -> Double {
        budget -= expense
        return budget
    }
    
    // sirkete yeni personel ekleme
    func addEmployee(emp : EmployeeModel) -> [EmployeeModel] {
        for  employee in [emp] {
            employeeList.append(employee)
        }
        return employeeList
    }
}
