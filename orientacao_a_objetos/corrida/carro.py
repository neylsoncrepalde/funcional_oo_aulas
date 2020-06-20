"""
Implmementação da classe carro
"""

class Carro:

    def __init__(self, modelo, potencia, habilidade):
        self.modelo = modelo
        self.potencia = potencia
        self.velocidade = 0
        self.habilidade = habilidade

    def acelerar(self):
        self.velocidade += (self.potencia * self.habilidade) / 2

    def frear(self):
        if self.velocidade == 0:
            pass
        else:
            self.velocidade -= self.potencia
