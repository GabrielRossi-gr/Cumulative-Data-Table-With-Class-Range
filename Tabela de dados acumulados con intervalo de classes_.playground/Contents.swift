//
//  main.swift
//  tabela com intervalos de classes
//
//  Created by Gabriel Rossi on 23/03/23.
//
//  tabebela de dados acumulados com intervalo de classes



import Foundation
import Swift
//vetor com os dados
var dados = [186, 170, 193, 180, 192, 183, 177, 167, 176, 158, 174, 185, 154, 156, 170, 168, 176, 178];
//variavel temporaria

//tamanho do vetor com casting para double <18>
var tamanhoVetor = Double(dados.count);

/*
 //regra de sturges DEFINIR QUANTIDADE DE DADOS
 var logaritimo = log(tamanhoVetor)
 //print(logaritimo)
 var quantClass = 1 + (3.3 * logaritimo);
 print(quantClass);
 */

//retorna quantidade de classes <qauntClass>
//teste da raiz
//pega o tamanho do vetor faz a raiz quadrada, muda o tipo e soma 1
var qC = tamanhoVetor.squareRoot();
var quantClass = Int(qC)+1

//trocar tamanho do vetor para int
var tamInt = dados.count;
//type(of: tamInt)

//organizar o vetor em ordem crescente <Bubble sort> rol
var temp = 0;
var trocou = false;
repeat{
    trocou = false;
    for x in 0..<tamInt{
        if x == dados.count - 1 {
            dados[x] = dados[x]
        } else {
           if dados[x] > dados[x+1] {
               temp = dados[x];
               dados[x] = dados[x+1];
               dados[x+1] = temp
               trocou = true;
           }
        }
    }
}while(trocou);

//amplitude total
var at = dados[tamInt-1] - dados[0]
//print(at)

//amplitude de classes
var amplitudeClass = (at / quantClass)+1
//print("tamanho da classe \(amplitudeClass)")
//print(amplitudeClass)
//print(type(of: amplitudeClass))

var l = dados[0];   //limite inferior
var L = l;          //limite superior
var f = 0;          //frequencia absoluta
var F = 0;          //frequencia acumulada
var i = 0;          //indice da tabela
var fr = 0.0;       //frequencia relativa
var Fr = 0.0;       //frequencia relativa acumulada
var 😀 = 0.0;       //variavel temporaria
var tempp = 0.0;    //variavel temporaria
var pc = 0;         //variavel temporaria
var pontoMedio = 0; //ponto medio
var acumuladorMedia = 0; //acumulador para a variavel de cima
var lModal = 0;     //lime]ite inferior classe modal
var fModal = 0;     //frequencia absoluta classe modal
var FrAnterior = 0.0;   //frequencia acumulada anterior classe moda
var FrPosterior = 0.0;  //frequencia posterior classe modal

//var frequenciasAcumuladas: Array<Double> = Array()
//var frequenciasAcumuladas = Array(repeating: 0, count: quantClass)
//var frequenciasAcumuladas: [10] = ;
var frequenciasAcumuladas = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; //vetor para armazenar frequencias acumuladas
//frequenciasAcumuladas[0] = 1;
//print(frequenciasAcumuladas[0])






var indiceModal = 0; //indice da classe modal para vetor de frequencias acumuladas
print("amplitude: \(amplitudeClass)")
print("classes: \(quantClass)")
print("--------------------------------------------------------")
print(" i    amplitude     f   F     fr       Fr       x")

for x in 0..<quantClass{
    //indice da tabela
    i = x;
    
    //limite superior da tabela
    L = L + amplitudeClass;
    
    //frequencia absoluta <f>
    for y in l..<L{
        if y >= l && y < L{
            //rodar vetor e buscar valor correspondente a  (y >= l && y < L)
            for z in 0..<tamInt{
                if dados[z] == y {
                    f = f+1;
                }
            }
        }
    }
       
    //frequencia acumulada
    if i == 0{
        F = f;
    }else{
        F = F + f;
    }
    //colocar todas as frequencias acumulativas em um vetor
    frequenciasAcumuladas[i] = F;
    //Double(frequenciasAcumuladas[i]) = Double(F);
    
    //frequencia relativa
    //frequencia relativa (transformando frequencia absoluta em double para calcular
    😀 = Double(f);
    //type(of: 😀)
    fr = (😀/tamanhoVetor)*100
    tempp = tempp + fr;
    
    //frequencia relativa acumulada
    if i == 0{
        Fr = fr;
    }else{
        Fr = Fr + fr;
    }
    
    //ponto medio para media de posicao
    pontoMedio = (l + L)/2;
    pc = (pontoMedio * f);
    acumuladorMedia = acumuladorMedia + pc;
    
    //classe modal
    if( fModal < f){
        //pega a frequencia absoluta modal
        fModal = f;
        //pega o limite inferior da classe inferior
        lModal = l
        //indice da classe modal
        indiceModal = i;
    }
    
    print(" \(x)   \(l)|---\(L)     \(f)   \(F)    \(String(format: "%.1f",fr))%    \(String(format: "%.1f",Fr))%     \(pontoMedio)");
    //zerar frequencia
    f = 0;
    //limite inferior da tabela
    l = L;
}
//printar total
print("--------------------------------------------------------")

//media de posicoes
print("media: \(acumuladorMedia/F)");

//processamento de mediana
FrAnterior = Double(frequenciasAcumuladas[indiceModal - 1]);
FrPosterior = Double(frequenciasAcumuladas[indiceModal + 1]);
var mediana1:Double = Double(lModal) + ((Double(F)/2) - FrAnterior) * Double(amplitudeClass) / Double(fModal)
print("mediana: \(String(format: "%0.1f",mediana1))  ");
//limite inferior modal
// lModal
//amplitude modal
// amplitudeClass
//somatoria de frequencia absoluta
// F
//frequencia absoluta modal
// fMaior


