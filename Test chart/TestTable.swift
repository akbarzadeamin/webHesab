//
//  TestTable.swift
//  Test chart
//
//  Created by amin akbarzade on 5/10/18.
//  Copyright © 2018 seyed amin akbarzade miri. All rights reserved.
//

import UIKit

class TestTable: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "sallam"
        return cell
    }

    
    @IBAction func btnSelect(_ sender: UIButton)
    {
        let indexPath = IndexPath(row: 7, section: 0)
        let indexPath2 = IndexPath(row: 8, section: 0)
        self.tbl.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.tbl.allowsMultipleSelection = true
        self.tbl.selectRow(at: indexPath2, animated: true, scrollPosition: .middle)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
