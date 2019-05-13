//
//  TarefasVC.swift
//  Teste
//
//  Created by Carlos Doki on 07/04/19.
//  Copyright © 2019 Carlos Doki. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TarefasVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tarefasTbl: UITableView!
    @IBOutlet var notificacaoVC: UIView!
    
    var tarefas = ["Tarefa 1 - Carregar navio", "Tarefa 2 - Manutenção dos equipamento", "Tarefa 3 - Treinamento Obrigatorio", "Tarefa 4 - Assistencia Social", "Tarefa 5 - Treinamento preventivo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tarefasTbl.delegate = self
        tarefasTbl.dataSource = self
        notificacaoVC.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificacaoVC.isHidden = true
        self.tarefasTbl.reloadData()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = tarefas[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TarefasTVC {
            cell.tarefasLbl.text = post
            return cell
        } else {
            return TarefasTVC()
        }
        
        
        //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return tarefas.count    }
        //
        //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let post = tarefas[indexPath.row]
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? tarefas {
        //            cell.tarefasLbl.text = post.texto
        //            //            cell.numeroLbl.text = post.projeto
        //            //            let dateFormatter = DateFormatter()
        //            //            dateFormatter.dateFormat = "dd/MM/yyyy"
        //            //            cell.dataLbl.text = dateFormatter.string(from: post.data.dateValue())
        //            //            cell.statusLbl.text = post.status
        //            //            cell.projetoLbl.text = post.descricao
        //            //            cell.valorLbl.text = "R$ \(String(format: "%.2f", post.valor))"
        //            //            //            cell.configureCell(data: post.data, doc: post.id, carteira: post.carteira, valor: post.valor, vendedor: post.vedendor )
        //            return cell
        //        } else {
        //            return tarefas
        //        }
        //    }
    }

}
