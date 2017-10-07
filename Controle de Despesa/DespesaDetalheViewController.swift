//
//  DespesaDetalheViewController.swift
//  Controle de Despesa
//
//  Created by iossenac on 30/09/17.
//  Copyright © 2017 Douglas Machry. All rights reserved.
//

import UIKit
import CoreData

class DespesaDetalheViewController: UIViewController {

    weak var managedObjectContext: NSManagedObjectContext?
    
    weak var despesa: Despesa? {
        didSet {
          
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var localEdit: UITextField!
    @IBOutlet weak var valorEdit: UITextField!
    
    
   
    
    

    @IBAction func inserirDespesa(_ sender: UIButton) {
        if let context = managedObjectContext {
            // ou atualiza a despesa existente...
            if let desp = despesa {
                desp.local = localEdit.text
                if (despesa?.valor) != nil{
                    valorEdit?.text = String(describing: valorEdit)
                }
                
            } else {
                let data = Date()
                
                // ou, se o usuario digitou um local, cria uma despesa...
                if let local = localEdit.text
                {
                    let valor = valorEdit.text
                    let _ = Despesa.createWith(local: local,
                                             valor: Float(valor!),
                                             data: data,
                                             in: context)
                }
            }
            // ao final, salva as alteracoes do documento.
            do {
                try context.save()
            } catch let error {
                print("\(error)")
            }
        }
        // retorna a tela anterior
        _ = navigationController?.popViewController(animated: true)
    }
        
    
    
    override func didReceiveMemoryWarning() {
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
