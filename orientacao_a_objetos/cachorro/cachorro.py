"""
Implementação da classe Cachorro
"""

class Cachorro:

    def __init__(self, nome, raca, idade, dono):
        self.nome = nome
        self.raca = raca
        self.idade = idade
        self.dono = dono
        self.temOsso = False

    def latir(self):
        if self.temOsso:
            print("Não consigo latir. Estou com osso na boca...")
        else:
            print('Au, au!')

    def darPatinha(self):
        print(';)')

    def pegarOsso(self):
        if self.temOsso:
            print("Já tenho um osso!")
        else:
            print('... Huuummm... Que osso gostoso!...')
            self.temOsso = True

    def largarOsso(self):
        if self.temOsso:
            print("Larguei o osso.")
            self.temOsso = False
        else:
            print("Não tenho osso.")
