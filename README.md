
# Template para listas de exercícios

Créditos a [Ted Pavlic](http://www.tedpavlic.com) pela primeira versão deste template. Créditos também ao [Roberto](https://github.com/robertomest) pela versão em português e por outros ajustes para que esta versão fosse possível. 

Este é um template simples criado para listas de exercícios.

Arquivos necessários: **template_listas.tex** e **homeworkclass.cls**

### Como usá-lo:

#### Informações iniciais

Algumas informações inicias para a capa e para o corpo do texto:

    \hmwkTitle{Lista de Exercícios \#1}
    \hmwkDueDate{Quinta,\ 21\ de\ Março,\ 2019}
    \hmwkClass{CPEXXX NOME DA MATÉRIA}
    \hmwkClassTime{Terças e Quintas: 08:00-10:00}
    \hmwkClassInstructor{Prof. Nome do Sobrenome}
    \hmwkAuthorName{Seu Nome Completo}
    \hmwkAuthorShortName{Seu nome} 

#### Uso

Existem dois ambientes.
Para exercícios:

    \begin{homeworkProblem}
    ...
    \end{homeworkProblem}
    
Para itens dos exercícios (para serem usados dentro dos ambientes de exercícios):

    \begin{homeworkSection}
    ...
    \end{homeworkSection}

#### Exemplo de uso
O repositório conta com um .pdf em que é possível ver um exemplo de uso. Em: [template_listas.pdf](https://github.com/mesquita/template_listas_exercicios/blob/master/template_listas.pdf "template_listas.pdf")

