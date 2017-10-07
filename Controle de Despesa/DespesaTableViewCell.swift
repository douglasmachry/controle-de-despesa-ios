//
//  DespesaTableViewCell.swift
//  Controle de Despesa
//
//  Created by iossenac on 23/09/17.
//  Copyright © 2017 Douglas Machry. All rights reserved.
//

import UIKit
import CoreData

class DespesaTableViewCell: UITableViewCell {

    weak var managedObjectContext: NSManagedObjectContext?
    
    
    
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var valor: UILabel!
    @IBOutlet weak var data: UILabel!
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
