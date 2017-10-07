//
//  ListaDespesasTableViewController.swift
//  Controle de Despesa
//
//  Created by iossenac on 23/09/17.
//  Copyright © 2017 Douglas Machry. All rights reserved.
//

import UIKit
import CoreData

class ListaDespesasTableViewController: CoreDataTableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        totalDespesa.text = String(Despesa.total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRequest()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    var fetchedResultsController: NSFetchedResultsController<Despesa>? {
        didSet {
            try? refreshData(for: fetchedResultsController)
        }
    }
    
    // MARK: - CoreDataTableViewController FetchedResultsController setup
    
    override func updateRequest()
    {
        let request : NSFetchRequest<Despesa> = Despesa.fetchRequest()
        request.sortDescriptors = [ NSSortDescriptor(key: "local", ascending: true) ]
        
        fetchedResultsController = getFetchedResultsController(for: request)
    }
    
    // MARK: - UITableView Cell Render
    @IBOutlet weak var totalDespesa: UILabel!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Despesa", for: indexPath) as! DespesaTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
                if let despesa = fetchedResultsController?.object(at: indexPath) {
                    if let data = despesa.data{
                        let datafinal: String = dateFormatter.string(from: (data as Date?)!)
                        cell.data?.text = datafinal
                    }
                

                    cell.local?.text = despesa.local
                    
            
                    cell.valor?.text = String(despesa.valor)
            
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DespesaDetalheViewController {
            destination.managedObjectContext = container?.viewContext
            if segue.identifier == "inserirDespesa" {
                destination.despesa = nil
            } else
                if let indexPath = tableView.indexPathForSelectedRow,
                    let despesa = fetchedResultsController?.object(at: indexPath) {
                    destination.despesa = despesa
            }
        }
    }
    
    


    
    
    
    

    
    /*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
