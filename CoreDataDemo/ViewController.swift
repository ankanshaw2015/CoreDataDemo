//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Yashom on 26/09/24.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var items:[Person] = []
    
    @IBOutlet weak var text: UITextField!
    
    @IBAction func addData(_ sender: Any) {
        tappedGoButton()
    }
    @IBOutlet weak var table: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    func tappedGoButton(){
        let person = Person(context: self.context)
        person.name = text.text
        person.rollNo = 1
        person.age = 23
        
        do{
            try self.context.save()
        }
        catch{
            
        }
        fetchData()
        
    }
    
    func fetchData(){
        do{
             self.items = try context.fetch(Person.fetchRequest())
            if !items.isEmpty{
                self.label.isHidden = true
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
            else{
                print("no data yet")
            }
            }
        catch{
            print("erron occurd")
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = self.items[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    

}

