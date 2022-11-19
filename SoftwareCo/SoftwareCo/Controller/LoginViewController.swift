//
//  LoginViewController.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 17.11.2022.
//

/*
 • Giriş Ekranında;
     ◦ Şirketin bilgileri yer almalıdır.
     ◦ Şirket gelir gider eklemeleri bu ekrandan yapılabilmelidir. --> - [] + yap
     ◦ Şirket maaş ödemesi bu ekrandan yapılabilmelidir. --> maasları ode butonu yap
     ◦ Çalışan ekle butonu olmalıdır.(Çalışan ekleme ekranı açılmalı) --> calisan ekle butonu yap
     ◦ Çalışan listele butonu olmalı.(Çalışan listesi ekranı açılmalı) --> listle butonu yap

 • Çalışan Listesi Ekranında;
     ◦ Çalışanlar listelenmelidir. --> table view yap (istersen collection ekle)
     ◦ UITableView veya UICollectionView kullanılmalıdır.
     ◦ Çalışanlar arasında isimden arama yapılabilmelidir. --> search ekle.
 */

import UIKit

class LoginViewController: UIViewController {
    
    var budget = 1000000.0
    var employeeList : [EmployeeModel] = []

    var company = Company()
    
    @IBOutlet weak var paymentTextField: UITextField!
    @IBOutlet weak var budgetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetLabel.text = String(self.company.budget)

    }
    
    @IBAction func paymentButtonClicked(_ sender: Any) {
        guard let quantity = Double(paymentTextField.text ?? "0.0") else { return }
        
        if self.company.budget >= quantity {
            self.company.budget -= quantity
            budgetLabel.text = String(self.company.budget)
        } else {
            print("odeme yapilamadi")
        }
        paymentTextField.text = ""
    }
    
    @IBAction func addBudgetButtonClicked(_ sender: Any) {
        guard let quantity = Double(paymentTextField.text ?? "0.0") else { return }
            self.company.budget += quantity
            budgetLabel.text = String(self.company.budget)
            paymentTextField.text = ""
    }
    
    @IBAction func paySalaryButtonClicked(_ sender: Any) {
        
        var salaries = 0.0
        for i in employeeList {
            salaries = salaries + i.salaryBase
        }

        if self.company.budget >= salaries {
            self.company.budget -= salaries
            budgetLabel.text = String(self.company.budget)
        } else {
            print("odeme yapilamadi")
        }
        paymentTextField.text = ""
    }
    
    @IBAction func listButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "listSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listSegue") {
            let destinationVC = segue.destination as! EmployeeListViewController
            destinationVC.employeeList = self.employeeList
            print("listele: \(destinationVC.employeeList)")

        }
    }
    
    @IBAction func addEmployeeButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "fromLoginToAddSegue", sender: nil)
    }
    
}
