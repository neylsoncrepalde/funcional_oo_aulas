from gerente import Gerente

class Diretor(Gerente):

    def obterLucro(self, lucro):
        self.renda += lucro
        print(f'O Diretor {self.nome} obteve lucro. Sua renda agora é de R${self.renda},00')

    def getRenda(self):
        print(f'A renda do diretor {self.nome} é R${self.renda},00')
