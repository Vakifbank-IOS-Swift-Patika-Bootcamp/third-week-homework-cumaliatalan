//
//  addEmployeeViewController.swift
//  SoftwareCo
//
//  Created by Cumali Atalan on 17.11.2022.
//

/*
• Çalışan Ekleme Ekranında;
    ◦ Çalışan bilgileri girilecektir.(İsim, yaş, çalışan türü vs)  --> isim text, yas integer, calisan turu secimli olsun ekle
    ◦ Çalışan maaşı otomatik hesaplanıp ekranda gösterilecektir. --> maas oto hesaplansin
    ◦ Çalışan ekle yapıldığında şirket ekranına yönlenmelidir. --> calisan ekle butonu ekle --> segue ile giris ekranina yönlendir.
    ◦ Bu ekranda UIStackView kullanılmalıdır.
 */

import UIKit

class addEmployeeViewController: UIViewController {

    var employeeList: [EmployeeModel] = [] // employeeModel'den olusan employeeList tanimaniyor
    var company = Company()
    
    // view baglantilari
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var experience: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    // personel ekleme fonksiyonu
    func addEmployee() {
        guard let name = nameTextField.text, //textfielddan gelen veriler optinal'dan cikarilir.
              let age = Int(ageTextField.text ?? "18"),
              let experience = Int(experience.text ?? "1"),
              var baseSalary = Double("500.0")
        else { return }
        
        baseSalary = baseSalary * Double(age) * Double(experience) // maas hesaplanir.
        self.salaryLabel.text = String(baseSalary)
        let employee = EmployeeModel(name: name, age: age, experience: experience, salaryBase: baseSalary) // calisan olusturulur
        self.employeeList.append(employee) // listeye eklenir.

    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    // ekleme butonuna basilirsa addEmployee func cagirilir.
    @IBAction func addButtonClicked(_ sender: Any) {
        self.addEmployee()
    }
    
    // listeye eklenen veriler giris sayfasina gonderilir. Bu sayede maas odemeleri hesaplanabilir.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue") {
            let destinationVC = segue.destination as! LoginViewController
            destinationVC.employeeList = self.employeeList
        }
    }
    
}
