//
//  EmployeeModel.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 19.11.2022.
//

import Foundation
struct EmployeeModel {
    var name: String
    var age : Int
    var experience : Int
    var salaryBase : Double
}

extension EmployeeModel {
    func calculateSalary(salaryBase: Double) -> Double {
        var salary = self.salaryBase
        salary = salary * Double(experience) * Double(age)
        return salaryBase
    }
}
