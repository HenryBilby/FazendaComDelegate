import UIKit

protocol Producao {
    func incrementaProducao(animal : Animal)
}

enum ProdutosFazenda{
    case Leite
    case Ovos
    case Lã
    case Couro
}

class Fazenda : Producao {
    var pastor : Pastor
    var produtos : [ProdutosFazenda : Int]
    
    init(pastor : Pastor) {
        self.produtos = [.Leite : 0,
                         .Ovos: 0,
                         .Lã: 0,
                         .Couro: 0]
        
        self.pastor = pastor
        self.pastor.delegate = self
    }
    
    func exibeProducaoAtual(){
        print ("==========Producao==========")
        for produto in self.produtos {
            switch produto.key {
                case .Leite:
                    print("Quantidade de Leite atual: \(produto.value)")
                case .Ovos:
                    print("Quantidade de Ovos atual: \(produto.value)")
                case .Lã:
                    print("Quantidade de Lã atual: \(produto.value)")
                case .Couro:
                    print("Quantidade de Couro atual: \(produto.value)")
            }
        }
        print ("==========================")
    }
    
    func incrementaProducao(animal : Animal){
        if let vaca = animal as? Vaca {
            self.produtos[.Leite]! += vaca.quantidadeLeite
        }
        if let galinha = animal as? Galinha {
            self.produtos[.Ovos]! += galinha.quantidadeOvos
        }
        if let ovelha = animal as? Ovelha {
            self.produtos[.Lã]! += ovelha.quantidadeLã
        }
    }
}

class Pastor {
    private let nome : String
    public var delegate : Producao?
    
    init (nome : String){
        self.nome = nome
    }
    
    func pastorearAnimais(animais : [Animal]){
        print ("\n Pastor \(self.nome) esta pastoreando os animais: ")
        for animal in animais{
            if !animal.isCrocodilo() {
                print("- \(animal.patente) nascido em \(animal.dataNascimento.description)")
                delegate?.incrementaProducao(animal: animal)
            }
        }
        print("\n")
    }
}

class Animal {
    var dataNascimento : Date
    var patente : String = ""
    
    init (dataNascimento: Date, patente : String){
        self.dataNascimento = dataNascimento
        self.patente = patente
    }
    
    func isCrocodilo() -> Bool{
        if self is Crocodilo{
            return true
        }
        return false
    }
}

class Vaca : Animal {
    let quantidadeLeite : Int
    
    init (quantidadeLeite : Int, dataNascimento : Date, patente: String){
        self.quantidadeLeite = quantidadeLeite
        super.init(dataNascimento: dataNascimento, patente: patente)
    }
}

class Ovelha : Animal {
    let quantidadeLã : Int
    
    init (quantidadeLã : Int, dataNascimento : Date, patente: String){
        self.quantidadeLã = quantidadeLã
        super.init(dataNascimento: dataNascimento, patente: patente)
    }
}

class Galinha : Animal {
    let quantidadeOvos : Int
    
    init (quantidadeOvos : Int, dataNascimento : Date, patente: String){
        self.quantidadeOvos = quantidadeOvos
        super.init(dataNascimento: dataNascimento, patente: patente)
    }
}

class Crocodilo : Animal {
    let quantidadeCouro : Int
    
    init (quantidadeCouro : Int, dataNascimento : Date, patente: String){
        self.quantidadeCouro = quantidadeCouro
        super.init(dataNascimento: dataNascimento, patente: patente)
    }
}

class Tomaco {
    let quantidadeTomaco : Int
    
    init(quantidadeTomaco : Int){
        self.quantidadeTomaco = quantidadeTomaco
    }
}

var crocodilo1 = Crocodilo (quantidadeCouro: 20, dataNascimento: Date(), patente: "PatenteCrocodilo1")
var crocodilo2 = Crocodilo (quantidadeCouro: 10, dataNascimento: Date(), patente: "PatenteCrocodilo2")
var crocodilo3 = Crocodilo (quantidadeCouro: 30, dataNascimento: Date(), patente: "PatenteCrocodilo3")

var vaca1 = Vaca(quantidadeLeite: 10, dataNascimento: Date(), patente: "PatenteVaca1")
var vaca2 = Vaca(quantidadeLeite: 8, dataNascimento: Date(), patente: "PatenteVaca2")
var vaca3 = Vaca(quantidadeLeite: 9, dataNascimento: Date(), patente: "PatenteVaca3")

var ovelha1 = Ovelha(quantidadeLã: 10, dataNascimento: Date(), patente: "PatenteOvelha1")
var ovelha2 = Ovelha(quantidadeLã: 12, dataNascimento: Date(), patente: "PatenteOvelha2")
var ovelha3 = Ovelha(quantidadeLã: 15, dataNascimento: Date(), patente: "PatenteOvelha3")

var galinha1 = Galinha(quantidadeOvos: 5, dataNascimento: Date(), patente: "PatenteGalinha1")
var galinha2 = Galinha(quantidadeOvos: 3, dataNascimento: Date(), patente: "PatenteGalinha2")
var galinha3 = Galinha(quantidadeOvos: 6, dataNascimento: Date(), patente: "PatenteGalinha3")

var animais = [crocodilo1,
               crocodilo2,
               crocodilo3,
               vaca1,
               vaca2,
               vaca3,
               ovelha1,
               ovelha2,
               ovelha3,
               galinha1,
               galinha2,
               galinha3]

var pastor = Pastor(nome: "Pastor1")

var nonSanto = Fazenda(pastor: pastor)

nonSanto.exibeProducaoAtual()

pastor.pastorearAnimais(animais: animais)

nonSanto.exibeProducaoAtual()
