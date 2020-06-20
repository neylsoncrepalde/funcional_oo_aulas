from colaborador import Colaborador

class Gerente(Colaborador):
    
    def __init__(self, nome, setor, renda):
        super().__init__(nome, setor)
        self.renda = renda

    def getRenda(self):
        print(f'A renda do gerente {self.nome} é R${self.renda},00')
