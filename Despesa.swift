import Foundation
import CoreData
import UIKit

class Despesa: NSManagedObject {
    
    static func createWith(local: String, valor: Float?, data: Date?, in context: NSManagedObjectContext) -> Despesa? {
        let request:  NSFetchRequest<Despesa> = Despesa.fetchRequest()
        //let query = "local == %@"
        //let params = [ local ]
        
        //request.predicate = NSPredicate(format: query, argumentArray: params)
        
        // tenta recuperar a despesa
        if let despesa = (try? context.fetch(request)) {
            if despesa.count == 0 {
                return despesa.first
            }
            
        }
        
        // senao cria a despesa
        if let despesa = NSEntityDescription.insertNewObject(forEntityName: "Despesa", into: context) as? Despesa {
            despesa.local = local
            despesa.valor = (valor)!
            despesa.data = data as NSDate?
            return despesa
        }
        
        
        // em caso de erro...
        return nil
    }
    
    
    static var total:Float{
        

        //let context: NSManagedObjectContext
        var valorTotal:Float = 0.00
        let consulta:  NSFetchRequest<Despesa> = Despesa.fetchRequest()
        if let valor = (try? (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext.fetch(consulta)){
            for v in valor!{
                valorTotal += v.valor
            }
        }
        
        return valorTotal
    }


        
        
        
        
}

