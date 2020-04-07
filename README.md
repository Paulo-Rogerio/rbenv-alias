# rbenv-alias

Mantém somente a última versão do Ruby na máquina. Esse script deve ser utilizado 
em ambientes que usam rbenv.

O script faz uso de um plugin chamado ```rbenv-aliases```

https://github.com/tpope/rbenv-aliases

Ex: Suponhamos que vc tenha uma lista de versões de Ruby instalado em sua máquina.

``` 
2.3.0
2.3.1
2.3.2
2.3.3
2.3.4
2.3.7
```

O script cuidará de manter apenas a ultima versão da 2.3.x, que no exemplo acima é: ```2.3.7```

E logo após criar Aliases para as outra versões apontando para a ultima instalada que no exemplo acima é: ```2.3.7```

O que ele faz é: 

```
rbenv uninstall 2.3.0
rbenv uninstall 2.3.1
rbenv uninstall 2.3.2
rbenv uninstall 2.3.3
rbenv uninstall 2.3.4

rbenv alias 2.3.0 2.3.7
rbenv alias 2.3.1 2.3.7
rbenv alias 2.3.2 2.3.7
rbenv alias 2.3.3 2.3.7
rbenv alias 2.3.4 2.3.7 
```
