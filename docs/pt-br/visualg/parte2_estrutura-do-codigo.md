# Parte 2: Estrutura do Código no VisuAlg

Esta parte do guia ensina como funciona a estrutura do código no VisuAlg e alguns dos principais comandos.

---

## Introdução ao Código

Ao abrir o VisuAlg, nos deparamos com o seguinte código:<br>
![Imagem: Código Inicial do VisuAlg](img/p1-i2.PNG)

Para facilitar, o código será mostrado nesse guia no seguinte formato:
```c
algoritmo "semnome"
// Função :
// Autor :
// Data : 30/06/2019
// Seção de Declarações 
var

inicio
// Seção de Comandos 
fimalgoritmo
```

### ``algoritmo "semnome"``
Este é o código que inicia o programa; no lugar de ``"semnome"`` pode-se colocar o nome do programa (mas isso não muda nada no funcionamento do código).<br>Exemplo:
```c
algoritmo "primeiro-programa"
```

### ``// Comentários``
São anotações em um código. Elas servem para esclarecer coisas e anotar informações, mas não afetam o código.<br>Exemplo:
```c
// Este é um comando em uma linha.
inicio // Este é um comentário no fim de uma linha. Tudo depois do "//" é somente comentários.
```

### ``var``
Este é um local onde é possível criar as variáveis que serão utilizadas ao decorrer do programa. Variáveis são espaços na memória do programa que podem receber valores, que poderão ser alterados e utilizados no programa.
```c
var a, b : inteiro
	h30, d : real
	e, teste : caractere
	uw4 : logico
```
O VisuAlg 2.5 aceita quatro tipos de variáveis diferentes:

- ``inteiro``: números inteiros, sem casas decimais.<br>Exemplo: ``2``
- ``real``: números reais. Podem ter ou não casas decimais, já que os números inteiros são um subconjunto dos números reais.<br>Outra coisa a se ressaltar é que se utiliza ``.`` ao invés de ``,`` para as casas decimais:<br>Exemplo: ``2``, ``5.0``, ``16.43``
- ``caractere``: conhecido como *string* na maioria das linguagens de programação - ou ainda *"cadeia de caracteres"* em português, se refere a qualquer tipo de texto. Esse texto deve ficar entre aspas.<br>Nota: números podem ser colocados dentro de um caractere, mas eles não poderão ser utilizados para expressões matemáticas.<br>Exemplo: ``"olá, mundo!"``, ``"eu comprei 64209 folhas de papel"`` ou até ``"a"`` ou ``"5"``.
- ``logico``: conhecido como *boolean* (ou *"booleano"*, aportuguesando) em outras linguagens, é um valor que só pode ser ``verdadeiro`` ou ``falso``. 

---

## A Fazer
- [x] Introdução ao código
- [x] Seção ``algoritmo "semnome"``
- [x] ``// Comentários``
- [x] Seção ``var``
- [ ] Expressões matemáticas, lógicas e etc (nota extra entre --- divisores ---)
- [ ] Introdução à seção ``inicio`` e ``fimalgoritmo``
- [ ] Como testar
- [ ] Comando ``escreva()``
- [ ] Comando ``escreval()``
- [ ] Comando ``leia()``
- Pegar mais daquele documento antigo que eu fiz