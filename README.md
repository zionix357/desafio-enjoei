# desafio-enjoei
Realizado em 9 de Fevereiro 2019.

instruções para o teste iOS enjoei
## o que esperamos:

• que você desenvolva as telas existentes no arquivo - “teste_ios.sketch”
o Sketch é um app pago, mas tem versão trial em https://www.sketchapp.com
• a tabbar deve ser funcional;
. items da tabbar na ordem: “home”, “search”, “upload”, “inbox”, “profile”
. a tela “01-listagem” é o primeiro item (home)
. os outros itens devem abrir uma tela com apenas um label com o nome do
item, devem ser telas distintas
• a listagem deve ser carregada do json via request da url:
https://pastebin.com/raw/qdfq10ii
não copie o arquivo para o projeto
• a listagem deve ter um pull to refresh utilizando o gif animado “01-pizzaloop.
gif” (ele deve ficar animado) como é mostrado na tela “01-listagem-pull”
. os novos itens devem ser carregados do seguinte json via request da url:
https://pastebin.com/raw/vNWpzLB9
não copie o arquivo para o projeto
• a listagem deve ter uma paginação, para isso novos itens devem ser
adicionados a listagem do seguinte json via request da url:
https://pastebin.com/raw/X2r3iTxJ
não copie o arquivo para o projeto
• as photos estão referenciadas no JSON com “image_public_id”
. a URL da imagem é a seguinte:
https://photos.enjoei.com.br/public/(tamanho)/(image_public_id).jpg
. exemplo: https://photos.enjoei.com.br/public/1100xN/
czM6Ly9waG90b3MuZW5qb2VpLmNvbS5ici9wcm9kdWN0cy81NDY0NDAwLzgyM
jNkZjU4YmJlZjBhYjIzODdhNDc1NjNmNzU4NDc0LmpwZw.jpg
. tamanhos válidos: 180x180, 460x460, 800x800, 828x186, 1100xN
• ao tocar em um item da listagem deve abrir a tela “02-detalhe”
. nessa tela deve conter a funcionalidade de fazer scroll horizontal das fotos dos
produtos

## o que esperamos - bonus track:
• desenvolva um UI test via XCTest com o seguinte cenário:
. navegue por cada item da tabbar
. retorne a tabbar da home
. faça um pull to refresh
. role a listagem até ter um “load more”
. acesse um item da listagem
. retorne a listagem

## regras do jogo:
• o código gerado deve ser em Swift 4 ou superior e compatível com iOS 10+
• nos envie o teste em um arquivo .zip - não publique em repositórios públicos
• ao retornar o teste, especificar qual versão do Xcode foi utilizada
• utilize, de preferência, o interface builder + auto-layout
• utilize cocoapods, carthage ou swift pm
. queremos ver você utilizar pelo menos uma biblioteca de terceiro
. vamos avaliar a escolha das bibliotecas e como você as utiliza.
• somos muuito criteriosos com UX
. os elementos da UI como dimensões, bordas, cores, nomes, estilos e
tamanhos de fonte (inclusas no pacote) devem seguir exatamente o que está
no “teste_ios.sketch”, considerando o iPhone 6 (7 e 8) como referência.
• gere uma estrutura de projeto organizada
• gere códigos bens estruturados e nomeados, códigos limpos e fáceis de
entender sem comentários ou documentação
• avaliamos o teste como uma entrega a ser publicada, então sem crash

bom teste! ;P
