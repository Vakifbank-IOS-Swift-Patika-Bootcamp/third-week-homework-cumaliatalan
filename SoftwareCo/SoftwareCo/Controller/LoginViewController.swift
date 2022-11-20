//
//  LoginViewController.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 17.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    

    var budget = 1000000.0 // sirket butcesi
    var employeeList : [EmployeeModel] = [] // calisan listesi

    var company = Company() // sirketi olusturuyoruz.
    
    // view baglantilari
    @IBOutlet weak var paymentTextField: UITextField!
    @IBOutlet weak var budgetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetLabel.text = String(self.company.budget) // butcenin kullanilmamis hali label'a yazilir.
    }
    
    // odeme yap butonuna basilirsa sirket butcesinden dusecek.
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
    
    // sirket butcesine gelir ekleme
    @IBAction func addBudgetButtonClicked(_ sender: Any) {
        guard let quantity = Double(paymentTextField.text ?? "0.0") else { return }
            self.company.budget += quantity
            budgetLabel.text = String(self.company.budget)
            paymentTextField.text = ""
    }
    
    // maas odemeleri butonu ile odeme yapilir.
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
    
    // calisanlarin listelendigi view'e yonlendirme yapar
    @IBAction func listButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "listSegue", sender: nil)
    }
    
    // calisan listesini bu sayfadan gonderiyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listSegue") {
            let destinationVC = segue.destination as! EmployeeListViewController
            destinationVC.employeeList = self.employeeList
            print("listele: \(destinationVC.employeeList)")

        }
    }
    
    // personel ekleme sayfasina gecis.
    @IBAction func addEmployeeButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "fromLoginToAddSegue", sender: nil)
    }
    
}
