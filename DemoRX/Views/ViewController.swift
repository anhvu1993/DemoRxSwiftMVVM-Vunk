//
//  ViewController.swift
//  DemoRX
//
//  Created by Anh vũ on 11/16/20.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var countLoanLbl: UILabel!
    @IBOutlet weak var countLblBorrow: UILabel!
    @IBOutlet weak var didLoan: UIButton!
    @IBOutlet weak var didBorrow: UIButton!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    
    var isZoom = true
    let vm = ManageDataVM()
    var listData:[ContentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        vm.configData()
        self.bindData()
        self.didLoanAction(self)
        countLoanLbl.text = "\(vm.listLoan.value.count)"
        countLblBorrow.text = "\(vm.listBorrow.value.count)"
    }
    
    func bindData() {
        vm.listLoan.filter{!$0.isEmpty}.subscribe(onNext: { data in
            self.listData = data
            self.tableView.reloadData()
        }).disposed(by: vm.disposeBag)
    }

    @IBAction func didLoanAction(_ sender: Any) {
        didLoan.setTitleColor(#colorLiteral(red: 0.1254901961, green: 0.4549019608, blue: 0.7725490196, alpha: 1), for: .normal)
        didBorrow.setTitleColor(#colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1), for: .normal)
        listData = vm.listLoan.value
        tableView.reloadData()
    }
    
    @IBAction func didBorrowAction(_ sender: Any) {
        didLoan.setTitleColor(#colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1), for: .normal)
        didBorrow.setTitleColor(#colorLiteral(red: 0.1254901961, green: 0.4549019608, blue: 0.7725490196, alpha: 1), for: .normal)
        listData = vm.listBorrow.value
        tableView.reloadData()
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            isZoom = true
        } else {
            isZoom = false
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = listData[indexPath.row]
        if isZoom {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as! ContentTableViewCell
            cell.bindData(obj: obj)
            return cell
        } else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
            cell.textLabel?.text = obj.name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            cell.detailTextLabel?.text = obj.price
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isZoom ? 100 : 50
    }
    
}
