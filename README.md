# desafio-enjoei

Realizado em 9 de Fevereiro 2019.

## Instruções para o teste iOS enjoei.

### o que esperamos:

1. Que você desenvolva as telas existentes no arquivo - “teste_ios.sketch” o Sketch é um app pago, mas tem versão trial em https://www.sketchapp.com
2. A tabbar deve ser funcional
3. Items da tabbar na ordem: “home”, “search”, “upload”, “inbox”, “profile”
4. A tela “01-listagem” é o primeiro item (home)
5. Os outros itens devem abrir uma tela com apenas um label com o nome do item, devem ser telas distintas
6. A listagem deve ser carregada do json via request da url: https://pastebin.com/raw/qdfq10ii - não copie o arquivo para o projeto
7. A listagem deve ter um pull to refresh utilizando o gif animado “01-pizzaloop.gif” (ele deve ficar animado) como é mostrado na tela “01-listagem-pull”
8. Os novos itens devem ser carregados do seguinte json via request da url: https://pastebin.com/raw/vNWpzLB9 - não copie o arquivo para o projeto
9. A listagem deve ter uma paginação, para isso novos itens devem ser adicionados a listagem do seguinte json via request da url: https://pastebin.com/raw/X2r3iTxJ - não copie o arquivo para o projeto
10. As photos estão referenciadas no JSON com “image_public_id”
11. A URL da imagem é a seguinte: https://photos.enjoei.com.br/public/(tamanho)/(image_public_id).jpg
12. Exemplo: https://photos.enjoei.com.br/public/1100xN/czM6Ly9waG90b3MuZW5qb2VpLmNvbS5ici9wcm9kdWN0cy81NDY0NDAwLzgyMjNkZjU4YmJlZjBhYjIzODdhNDc1NjNmNzU4NDc0LmpwZw.jpg
13. Tamanhos válidos: 180x180, 460x460, 800x800, 828x186, 1100xN
14. Ao tocar em um item da listagem deve abrir a tela “02-detalhe”
15. Nessa tela deve conter a funcionalidade de fazer scroll horizontal das fotos dos produtos

### o que esperamos - bonus track:
16. Desenvolva um UI test via XCTest com o seguinte cenário:
17. Navegue por cada item da tabbar
18. Retorne a tabbar da home
19. Faça um pull to refresh
20. Role a listagem até ter um “load more”
21. Acesse um item da listagem
22. Retorne a listagem

## regras do jogo:
* O código gerado deve ser em Swift 4 ou superior e compatível com iOS 10+
* Nos envie o teste em um arquivo .zip - não publique em repositórios públicos
* Ao retornar o teste, especificar qual versão do Xcode foi utilizada
* Utilize, de preferência, o interface builder + auto-layout
* Utilize cocoapods, carthage ou swift pm
* Queremos ver você utilizar pelo menos uma biblioteca de terceiro
* Vamos avaliar a escolha das bibliotecas e como você as utiliza.
* Somos muuito criteriosos com UX
* Os elementos da UI como dimensões, bordas, cores, nomes, estilos e tamanhos de fonte (inclusas no pacote) devem seguir exatamente o que está no “teste_ios.sketch”, considerando o iPhone 6 (7 e 8) como referência.
* Gere uma estrutura de projeto organizada
* Gere códigos bens estruturados e nomeados, códigos limpos e fáceis de entender sem comentários ou documentação
* Avaliamos o teste como uma entrega a ser publicada, então sem crash

bom teste! ;P
