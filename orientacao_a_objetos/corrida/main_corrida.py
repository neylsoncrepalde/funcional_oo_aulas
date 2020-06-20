"""
Implementação da simulação da corrida
"""

from carro import Carro
import random
import numpy as np

# Cenário 3 - Corrida com SORTE e HABILIDADE DO MOTORISTA
c1 = Carro('Palio', 2, 8)
c2 = Carro('Corolla', 4, 6)
c3 = Carro('Ferrari', 6, 5)

# Simulação da corrida
# pista de 1000 metros

distancia = [0, 0, 0]
rodadas = 0

# Num pista de 1000 cada um dos carros vai acelerar. 
# O primeiro carro que atingir a marca de 1000 metros é o vencedor.

# loop while
while max(distancia) < 1000:
    if random.uniform(0,1) < .5:
        c1.acelerar()
    distancia[0] += c1.velocidade
    if random.uniform(0,1) < .5:
        c2.acelerar()
    distancia[1] += c2.velocidade
    if random.uniform(0,1) < .5:
        c3.acelerar()
    distancia[2] += c3.velocidade
    rodadas += 1

print(distancia)
print(f'Foram realizadas {rodadas} rodadas.')
print(f'O vencedor foi o carro {np.argmax(distancia) + 1}')
